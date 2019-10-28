//
//  AppCoordinator.h
//  MainProject-MultiPod
//
//  Created by gxy on 2019/10/28.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Coordinator.h"
#import "NavigationCoordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppCoordinator : NavigationCoordinator<Coordinator>
//-(instancetype)initWithRootViewController:(UIViewController *)rootViewController;
@end

NS_ASSUME_NONNULL_END
