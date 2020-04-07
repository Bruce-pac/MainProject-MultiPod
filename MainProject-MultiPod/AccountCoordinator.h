//
//  AccountCoordinator.h
//  MainProject-MultiPod
//
//  Created by gxy on 2020/4/7.
//  Copyright © 2020 Bruce. All rights reserved.
//

#import <XDCoordinator/LBNavigationCoordinator.h>
#import <UserInfo.h>

NS_ASSUME_NONNULL_BEGIN

@class AccountCoordinator;
@protocol AccountCoordinatorDelegate <NSObject>

- (void)accountCoordinatorOnTapAvatar:(AccountCoordinator *)account;

@end

@interface AccountCoordinator : LBNavigationCoordinator
@property (nonatomic, weak) id<AccountCoordinatorDelegate> delegate;

- (void)updateUserInfo:(UserInfo *)info;
@end

NS_ASSUME_NONNULL_END
