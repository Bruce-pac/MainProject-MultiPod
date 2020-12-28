//
//  XMPayModuleEventHandler.m
//  MainProject-MultiPod
//
//  Created by gxy on 2020/12/17.
//  Copyright © 2020 Bruce. All rights reserved.
//

#import "XMPayModuleEventHandler.h"
#import "PayFeatureModule.h"
#import "MainDependencyManager.h"

@import LoginPod;

@interface XMPayModuleEventHandler ()<LBFeatureModuleDelegate>

@end

@implementation XMPayModuleEventHandler

- (void)handleEvent:(LBCoordinatorEventName)event object:(id)object userInfo:(NSDictionary *)userInfo asyncHandler:(void (^)(id _Nullable))asyncHandler{
    if (![[self eventsCanBeHandled] containsObject:event]) {
        return;
    }
    if ([event isEqualToString: kPayModuleNeedLoginStateEvent]) {
        LoginFeatureModule *login = (LoginFeatureModule *)[[LBFeatureModuleManager sharedManager] fetchModuleWithId:NSStringFromClass(LoginFeatureModule.class)];
        asyncHandler(@(login.loginState));
    }
    else if ([event isEqualToString: kPayModuleToLoginModuleEvent]) {
        LoginFeatureModule *login = (LoginFeatureModule *)[[LBFeatureModuleManager sharedManager] fetchModuleWithId:NSStringFromClass(LoginFeatureModule.class)];
        [login injectDependencies:
         @{kLoginModuleDependencyKeyHttpClient:MainDependencyManager.httpClient}];
        login.delegate = self;
        [login launchWithOptions:userInfo];
        [login subscribeLoginState:^(BOOL success) {
            asyncHandler(@(success));
        }];
    }
}

- (NSArray<LBCoordinatorEventName> *)eventsCanBeHandled {
    return @[
        kPayModuleNeedLoginStateEvent,
        kPayModuleToLoginModuleEvent
    ];
}

- (void)featureModuleWillTerminate:(id<LBFeatureModule>)module{
    [LBFeatureModuleManager.sharedManager releaseModule:module];
}

@end
