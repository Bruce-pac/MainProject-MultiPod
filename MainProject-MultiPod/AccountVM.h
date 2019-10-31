//
//  AccountVM.h
//  MainProject-MultiPod
//
//  Created by gxy on 2019/11/1.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class UserInfo;

typedef void(^UserNameListenser)(NSAttributedString *_Nullable userName);

@interface AccountVM : NSObject
- (void)updateUserInfo:(UserInfo *)info;
- (void)subscribeUserName:(UserNameListenser)listener;
@end

NS_ASSUME_NONNULL_END
