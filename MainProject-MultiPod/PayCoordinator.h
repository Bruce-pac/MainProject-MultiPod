//
//  PayCoordinator.h
//  MainProject-MultiPod
//
//  Created by gxy on 2020/4/7.
//  Copyright © 2020 Bruce. All rights reserved.
//

#import <XDCoordinator/LBNavigationCoordinator.h>

NS_ASSUME_NONNULL_BEGIN

@interface PayCoordinator : LBNavigationCoordinator
- (void)startWithPId:(NSInteger)pId;
@end

NS_ASSUME_NONNULL_END
