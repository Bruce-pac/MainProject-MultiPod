//
//  AccountFeatureModule.m
//  MainProject-MultiPod
//
//  Created by gxy on 2020/12/17.
//  Copyright © 2020 Bruce. All rights reserved.
//

#import "AccountFeatureModule.h"
#import "AccountCoordinator.h"

@interface AccountFeatureModule ()
@property (nonatomic, strong) AccountCoordinator *rootCoordinator;
@end

@implementation AccountFeatureModule
@synthesize delegate;

- (void)launchWithOptions:(nullable NSDictionary *)options {
    [self.rootCoordinator startWithOptions:options];
}

- (NSString *)uniqueId{
    return NSStringFromClass(self.class);
}

- (UIViewController *)rootVC {
    return self.rootCoordinator.rootVC;
}

- (void)updateUserInfo:(AccountInfo *)info{
    [self.rootCoordinator updateUserInfo:info];
}

- (AccountCoordinator *)rootCoordinator{
    if (!_rootCoordinator) {
        _rootCoordinator = [[AccountCoordinator alloc] initWithRootVC:[UINavigationController new]];
    }
    return _rootCoordinator;
}
@end
