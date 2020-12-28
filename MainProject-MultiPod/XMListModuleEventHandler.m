//
//  XMListModuleEventHandler.m
//  MainProject-MultiPod
//
//  Created by gxy on 2020/12/17.
//  Copyright © 2020 Bruce. All rights reserved.
//

#import "XMListModuleEventHandler.h"
@import ListPod;
#import "PayFeatureModule.h"
#import "AppCoordinator.h"


@implementation XMListModuleEventHandler
- (void)handleEvent:(LBCoordinatorEventName)event object:(id)object userInfo:(NSDictionary *)userInfo asyncHandler:(void (^)(id _Nullable))asyncHandler{
    if (![[self eventsCanBeHandled] containsObject:event]) {
        return;
    }
    if ([event isEqualToString: ListPodCoordinatorEvent.detailBToAccount]) {
        [UIViewController lb_topVisibleViewController].tabBarController.selectedIndex = 1;
//        self.rootVC.selectedViewController = self.accountModule.rootVC;
    }
    else if ([event isEqualToString: ListPodCoordinatorEvent.detailToPay]) {
        id<LBFeatureModule> payModule = [[LBFeatureModuleManager sharedManager] fetchModuleWithId:NSStringFromClass(PayFeatureModule.class)];
        [payModule launchWithOptions:userInfo];
    }
}

- (NSArray<LBCoordinatorEventName> *)eventsCanBeHandled {
    return @[
        ListPodCoordinatorEvent.detailToPay,
        ListPodCoordinatorEvent.detailBToAccount
    ];
}
@end
