//
//  AccountViewController.h
//  MainProject-MultiPod
//
//  Created by gxy on 2019/10/31.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountVM.h"

NS_ASSUME_NONNULL_BEGIN
@class AccountViewController;

@protocol AccountViewControllerDelegate <NSObject>

-(void)onTapAccountBtn:(AccountViewController *)vc;

@end

@interface AccountViewController : UIViewController
@property (nonatomic, weak) id<AccountViewControllerDelegate> delegate;
-(instancetype)initWithViewModel:(AccountVM *)vm;
@end

NS_ASSUME_NONNULL_END
