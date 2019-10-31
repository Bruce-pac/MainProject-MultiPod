//
//  AppCoordinator.h
//  MainProject-MultiPod
//
//  Created by gxy on 2019/10/28.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <XDCoordinator-umbrella.h>
#import "MainTabBarViewController.h"
#import <ListPod-Swift.h>
#import <BPDependency.h>


NS_ASSUME_NONNULL_BEGIN

@interface AppCoordinator : BaseCoordinator<MainTabBarViewController *>
@end

@interface AppCoordinator (ListPodCoordinatorTypeImp)<ListPodCoordinatorType>

@end

@interface AppCoordinator (LoginCoordinatorDelegateImp)<LoginCoordinatorDelegate>

@end

NS_ASSUME_NONNULL_END
