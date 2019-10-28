//
//  NavigationCoordinator.h
//  MainProject-MultiPod
//
//  Created by gxy on 2019/10/28.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UINavigationController.h>
#import "Coordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface NavigationCoordinator : NSObject<Coordinator>
@property (nonatomic, weak, readonly) UINavigationController *rootNav;
-(instancetype)initWithRootNavVC:(UINavigationController *)rootNav;
@end

NS_ASSUME_NONNULL_END
