//
//  MainCoordinator.m
//  MainProject-MultiPod
//
//  Created by gxy on 2019/9/18.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "MainCoordinator.h"
#import <UIKit/UIKit.h>
#import <LoginViewController.h>

@implementation MainCoordinator

- (void)loginFailureBased:(nonnull UIViewController *)vc {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"failure" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [vc dismissViewControllerAnimated:YES completion:nil];
    }]];
    [vc presentViewController:alert animated:true completion:nil];
}

- (void)loginSuccess:(nonnull UserInfo *)info based:(nonnull UIViewController *)vc {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"success" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [vc dismissViewControllerAnimated:YES completion:nil];
    }]];
    [vc presentViewController:alert animated:true completion:nil];
}

- (void)jumpPayPageWithBased:(UIViewController * _Nonnull)vc with:(id _Nonnull)data {
    uint32_t num = arc4random();
    BOOL isLogin = num % 2;

    if (isLogin) {
        UIViewController *pay = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PayViewController"];
        [vc.navigationController pushViewController:pay animated:YES];
    }else{
        UIViewController *login = [LoginViewController new];
        [vc presentViewController:login animated:YES completion:nil];
    }
}

@end
