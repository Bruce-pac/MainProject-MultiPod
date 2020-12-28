//
//  PayFeatureModule.h
//  MainProject-MultiPod
//
//  Created by gxy on 2020/12/6.
//  Copyright © 2020 Bruce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LBCoordinator/LBFeatureModule.h>
#import "PayCoordinator.h"
#import "PayFeatureModuleEvents.h"

NS_ASSUME_NONNULL_BEGIN

@interface PayFeatureModule : NSObject<LBFeatureModule>
@property (nonatomic, strong, readonly) PayCoordinator *rootCoordinator;
@end

NS_ASSUME_NONNULL_END
