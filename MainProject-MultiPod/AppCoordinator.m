//
//  AppCoordinator.m
//  MainProject-MultiPod
//
//  Created by gxy on 2019/10/28.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "AppCoordinator.h"
#import <ListPod/ListPod-Swift.h>
#import <LoginCoordinator.h>
#import "AccountCoordinator.h"
#import "PayCoordinator.h"

@interface AppCoordinator ()<AccountCoordinatorDelegate>
@property (nonatomic, weak) MainTabBarViewController *rootVC;
@property (nonatomic, weak) AccountCoordinator *accountCoordinator;
@end

@implementation AppCoordinator

@dynamic rootVC;

- (void)start{
    UINavigationController *listNav = [UINavigationController new];
    ListCoordinator *listCoordinator = [[ListCoordinator alloc] initWithRootVC:listNav];
    [self startChildCoordinator:listCoordinator];

    UINavigationController *accountNav = [UINavigationController new];
    AccountCoordinator *account = [[AccountCoordinator alloc] initWithRootVC:accountNav];
    account.delegate = self;
    [self startChildCoordinator:account];
    self.accountCoordinator = account;
    accountNav.title = @"account";
    listNav.title = @"list";
    self.rootVC.viewControllers = @[listNav, accountNav];
}

- (void)startLoginFlow{
    UINavigationController *loginRoot = [UINavigationController new];
    LoginCoordinator *loginFlow = [[LoginCoordinator alloc] initWithRootVC:loginRoot];
    [self startChildCoordinator:loginFlow];
    [self.rootVC presentViewController:loginRoot animated:YES completion:nil];
}

- (void)accountCoordinatorOnTapAvatar:(nonnull AccountCoordinator *)account {
    [self startLoginFlow];
}

/*
 层级深的时候利用响应者链也可以跨组件调用
 */
- (void)lb_coordinatingMessage:(LBCoordinatorEventName)event object:(id)object userInfo:(NSDictionary *)userInfo{
    if ([event isEqualToString: LBCoordinatorEvent.detailBToAccount]) {
        self.rootVC.selectedViewController = self.accountCoordinator.rootVC;
    }
}

@end

@implementation AppCoordinator (ListPodCoordinatorTypeImp)

- (void)listCoordinator:(ListCoordinator *)coordinator jumpPayPageWith:(ListItemOC *)data{
    uint32_t num = arc4random();
    BOOL isLogin = num % 2;

    if (isLogin) {
        PayCoordinator *pay = [[PayCoordinator alloc] initWithRootVC:coordinator.rootVC];
        pay.didCompleted = ^(__kindof LBBaseCoordinator * _Nonnull coordinator) {
            [self stopChildCoordinator:coordinator];
        };
        [self addChildCoordinator:pay];
        [pay startWithPId:data.pId];
    }else{
        [self startLoginFlow];
    }
}

@end

@implementation AppCoordinator (LoginCoordinatorDelegateImp)

- (void)loginFlowOnTapClose:(LoginCoordinator *)loginFlow{
    [self.rootVC dismissViewControllerAnimated:YES completion:^{
        [self stopChildCoordinator:loginFlow];
    }];
}

- (void)loginFlowOnFailure:(LoginCoordinator *)loginFlow{
    [self stopChildCoordinator:loginFlow];
}

- (void)loginFlow:(LoginCoordinator *)loginFlow onLoginSuccess:(UserInfo *)info{
    [self stopChildCoordinator:loginFlow];
    [self.accountCoordinator updateUserInfo:info];
}

@end
