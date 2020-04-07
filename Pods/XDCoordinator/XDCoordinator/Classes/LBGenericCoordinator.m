//
//  LBGenericCoordinator.m
//  Tendaisy
//
//  Created by Bruce on 2019/12/5.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "LBGenericCoordinator.h"
#import "UIViewController+LBCoordinator.h"

@interface LBGenericCoordinator ()
@property (nonatomic, strong, readwrite) __kindof UIViewController *rootVC;
@end

@implementation LBGenericCoordinator
- (instancetype)initWithRootVC:(UIViewController *)rootVC{
    self = [super init];
    if (self) {
        _rootVC = rootVC;
        _rootVC.lb_coordinator = self;
    }
    return self;
}
@end
