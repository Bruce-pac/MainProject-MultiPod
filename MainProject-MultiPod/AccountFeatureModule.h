//
//  AccountFeatureModule.h
//  MainProject-MultiPod
//
//  Created by gxy on 2020/12/17.
//  Copyright © 2020 Bruce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountInfo.h"
@import LBCoordinator;

NS_ASSUME_NONNULL_BEGIN

@interface AccountFeatureModule : NSObject<LBFeatureModule>


- (void)updateUserInfo:(AccountInfo *)info;
@end

NS_ASSUME_NONNULL_END
