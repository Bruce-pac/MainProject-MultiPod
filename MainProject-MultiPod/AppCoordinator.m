//
//  AppCoordinator.m
//  MainProject-MultiPod
//
//  Created by gxy on 2019/10/28.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "AppCoordinator.h"
#import <ListPod/ListPod-Swift.h>
#import <LoginPod/LoginFeatureModule.h>
#import "AccountFeatureModule.h"
#import "MainDependencyManager.h"

#import "XMListModuleEventHandler.h"
#import "XMPayModuleEventHandler.h"

@interface AppCoordinator ()<LBFeatureModuleDelegate>
@property (nonatomic, weak) MainTabBarViewController *rootVC;
@property (nonatomic, weak) AccountFeatureModule *accountModule;
@property (nonatomic, strong) ListFeatureModule *listModule;
@property (nonatomic, strong) NSDictionary<NSString *, Class> *eventHandlerMap;
@end

@implementation AppCoordinator

@dynamic rootVC;

- (void)startWithOptions:(NSDictionary *)options{
    UINavigationController *listNav = [UINavigationController new];
    ListFeatureModule *listModule = [[ListFeatureModule alloc] initWithRootNavVC:listNav];
//    [self startFeatureModule:listModule];
    [self addChildCoordinator:listModule.rootCoordinator];
    [listModule launchWithOptions:nil];
    self.listModule = listModule;

    id<LBFeatureModule> account = [LBFeatureModuleManager.sharedManager fetchModuleWithId:NSStringFromClass(AccountFeatureModule.class)];
    [self addChildCoordinator:account.rootCoordinator];
    [account launchWithOptions:@{@"title": @"account"}];
    self.accountModule = (AccountFeatureModule *)account;

    account.rootVC.title = @"account";
    listNav.title = @"list";
    self.rootVC.viewControllers = @[listModule.rootVC, account.rootVC];
}

/*
 在总控协调中介者这里处理所有组件通信消息，非常方便添加诸如日志、消息回溯、权限控制、兼容适配等代码。因为在主工程里，又可以针对所在App程序写一些特定代码。
 如果嫌ifelse太多，可以用策略模式，也方便再拆分和复用。针对此APP的可以保留在主工程，有些可以通用的，可以在多个APP间复用并且处理操作也一样的，就可以拆出来下沉。

 为什么一定要有总控，并且由他来进行映射调用，不能仅仅执行调用，因为只有这样才能真正解耦，其他的都是假解耦！在业务组件内部，只要你是指定了调用的具体类或者是具体方法名（就算它们是字符串），或者是另外生成的协议，无论你是perform target action 还是什么invocation，都是没用的，因为假如那个提供服务的组件被多个组件使用，那么只要一改动那个组件就要牵一发动全身，所有组件都要跟着改（可能会加很多重复的适配代码），改动非常大，这很明显反人类，而放在总控这里只需要改动一处，根本不需要重新打包其他库，非常灵活。
*/

- (void)lb_coordinatingMessage:(LBCoordinatorEventName)event object:(id)object userInfo:(NSDictionary *)userInfo asyncHandler:(void (^)(id _Nonnull))asyncHandler{
    Class handlerClass = self.eventHandlerMap[event];
    id<LBCoordinatorEventHandler> handler = [[handlerClass alloc] init];
    [handler handleEvent:event object:object userInfo:userInfo asyncHandler:nil];

    if ([event isEqualToString:kLoginModuleLoginStateChangeEvent]) {
        BOOL result = [object boolValue];
        if (result) {
            UserInfo *user = userInfo[@"userInfo"];
            // 若账号体系不互通，可以在这做转换操作
            [self.accountModule updateUserInfo:[AccountInfo new]];
        }
    }
}

- (NSDictionary<NSString *,Class> *)eventHandlerMap{
    if (!_eventHandlerMap) {
        _eventHandlerMap = @{
            ListPodCoordinatorEvent.detailBToAccount: XMListModuleEventHandler.class,
            ListPodCoordinatorEvent.detailToPay: XMListModuleEventHandler.class,
            kPayModuleNeedLoginStateEvent: XMPayModuleEventHandler.class,
            kPayModuleToLoginModuleEvent: XMPayModuleEventHandler.class
        };
    }
    return _eventHandlerMap;
}

@end
