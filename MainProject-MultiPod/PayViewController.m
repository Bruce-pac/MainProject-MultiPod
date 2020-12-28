//
//  PayViewController.m
//  MainProject-MultiPod
//
//  Created by gxy on 2019/9/18.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "PayViewController.h"
#import "PayFeatureModuleEvents.h"

@interface PayViewController ()

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"viewDidLoad  %ld", (long)self.pId);
}

- (IBAction)onTapPay:(id)sender {
    [self lb_coordinatingMessage:kPayModuleNeedLoginStateEvent object:self userInfo:nil asyncHandler:^(id _Nonnull data) {
        BOOL isLogin = [data boolValue];
        if (isLogin) {
            [self.payViewModel payWithId:self.pId];
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"登录后才能支付" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"去登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self lb_coordinatingMessage:kPayModuleToLoginModuleEvent object:self userInfo:nil asyncHandler:^(NSNumber *_Nonnull data) {
                    BOOL success = [data boolValue];
                    if (success) {
                        [self.payViewModel payWithId:self.pId];
                    }
                }];
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [self presentViewController:alert animated:true completion:nil];
        }
    }];
}


@end
