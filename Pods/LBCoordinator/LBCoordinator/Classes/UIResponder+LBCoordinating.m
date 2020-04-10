//
//  UIResponder+LBCoordinator.m
//  Tendaisy
//
//  Created by Bruce on 2019/12/3.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "UIResponder+LBCoordinating.h"


@implementation UIResponder (LBCoordinating)
- (UIResponder *)coordinatingResponder{
    return self.nextResponder;
}

- (void)lb_coordinatingMessage:(LBCoordinatorEventName)event object:(id)object userInfo:(NSDictionary *)userInfo{
    [self.coordinatingResponder lb_coordinatingMessage:event object:object userInfo:userInfo];
}
@end
