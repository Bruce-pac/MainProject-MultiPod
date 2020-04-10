//
//  PayViewController.h
//  MainProject-MultiPod
//
//  Created by gxy on 2019/9/18.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PayViewController : UIViewController
@property (nonatomic, assign) NSInteger pId;
@property (nonatomic, strong) PayViewModel *payViewModel;
@end

NS_ASSUME_NONNULL_END
