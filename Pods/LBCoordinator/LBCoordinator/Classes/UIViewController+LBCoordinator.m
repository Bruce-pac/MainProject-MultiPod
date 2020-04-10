//
//  UIViewController+LBCoordinator.m
//  Tendaisy
//
//  Created by Bruce on 2019/12/3.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "UIViewController+LBCoordinator.h"
#import <objc/runtime.h>

static NSString *const kParentCoordinatorKey = @"kParentCoordinatorKey";

@implementation UIViewController (LBCoordinator)

- (LBBaseCoordinator *)lb_coordinator{
    return objc_getAssociatedObject(self, &kParentCoordinatorKey);
}

- (void)setLb_coordinator:(LBBaseCoordinator *)lb_coordinator{
    objc_setAssociatedObject(self, &kParentCoordinatorKey, lb_coordinator, OBJC_ASSOCIATION_ASSIGN);
}

- (UIResponder *)coordinatingResponder{
    if (self.lb_coordinator) {
        return self.lb_coordinator;
    }
    if (self.parentViewController) {
        return self.parentViewController;
    }
    return self.nextResponder;
}

@end
