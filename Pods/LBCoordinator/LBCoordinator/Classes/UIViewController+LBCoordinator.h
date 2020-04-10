//
//  UIViewController+LBCoordinator.h
//  Tendaisy
//
//  Created by Bruce on 2019/12/3.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBBaseCoordinator.h"
#import "UIResponder+LBCoordinating.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (LBCoordinator)
@property (nonatomic, weak) LBBaseCoordinator *lb_coordinator;
@end

NS_ASSUME_NONNULL_END
