//
//  PayFeatureModule.m
//  MainProject-MultiPod
//
//  Created by gxy on 2020/12/6.
//  Copyright © 2020 Bruce. All rights reserved.
//

#import "PayFeatureModule.h"
#import "PayCoordinator.h"
@import LBCoordinator;

@interface PayFeatureModule ()
@property (nonatomic, strong, readwrite) PayCoordinator *rootCoordinator;
@property (nonatomic, assign) BOOL isPresentedRoot;
@end

@implementation PayFeatureModule
@synthesize delegate;

- (void)launchWithOptions:(nullable NSDictionary *)options {
    // 判断当前存不存在navigationController，若有用现成的，没有则new新的并present出来
    UINavigationController *currentNav = [UIViewController lb_topVisibleViewController].navigationController;
    if (currentNav) {
        [self makeRootCoordinatorWithRootVC:currentNav];
    }else{
        [self makeRootCoordinatorWithRootVC:[UINavigationController new]];
    }
    [[UIViewController lb_topVisibleViewController].lb_coordinator addChildCoordinator:self.rootCoordinator];
    [self.rootCoordinator startWithOptions:options];
    if (!currentNav) {
        [[UIViewController lb_topVisibleViewController] presentViewController:self.rootCoordinator.rootVC animated:true completion:nil];
        self.isPresentedRoot = YES;
    }
}

- (NSString *)uniqueId{
    return NSStringFromClass(self.class);
}

- (void)makeRootCoordinatorWithRootVC:(UINavigationController *)rootVC {
    _rootCoordinator = [[PayCoordinator alloc] initWithRootVC:rootVC];
    __weak typeof(self) weakSelf = self;
    _rootCoordinator.didCompleted = ^(__kindof LBBaseCoordinator * _Nonnull coordinator) {
        if (weakSelf.isPresentedRoot) {
            [rootVC dismissViewControllerAnimated:true completion:nil];
        }
        [coordinator.parentCoordinator stopChildCoordinator:coordinator];
        [coordinator.parentCoordinator activate];

    };
}

@end
