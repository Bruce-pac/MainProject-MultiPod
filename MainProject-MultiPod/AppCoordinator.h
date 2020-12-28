//
//  AppCoordinator.h
//  MainProject-MultiPod
//
//  Created by gxy on 2019/10/28.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <LBCoordinator/LBCoordinator.h>
#import "MainTabBarViewController.h"
#import <ListPod-Swift.h>
#import <BPDependency.h>
#import "PayCoordinator.h"
#import "PayFeatureModule.h"


NS_ASSUME_NONNULL_BEGIN

@interface AppCoordinator : LBGenericCoordinator<MainTabBarViewController *>
@end

NS_ASSUME_NONNULL_END
