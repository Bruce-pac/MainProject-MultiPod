//
//  LoginCoordinator.m
//  LoginPod
//
//  Created by 顾鑫烨 on 2019/10/30.
//

#import "LoginCoordinator.h"
#import "LoginViewController.h"
#import "LoginViewModel.h"
#import "LoginModuleManager.h"
#import "UserInfo.h"

@implementation LoginCoordinator
- (void)start{
    LoginViewModel *vm = [LoginViewModel new];
    LoginViewController *vc = [[LoginViewController alloc] initWithViewModel:vm];
    vc.delegate = self;
    [self.rootVC pushViewController:vc animated:NO];
}

- (void)loginResult:(BOOL)result vc:(nonnull UIViewController *)vc {
    NSString *title = result ? @"success" : @"failure";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [vc dismissViewControllerAnimated:result completion:^{
            if (result) {
                [[[LoginModuleManager shared] dependency].coordinator onLoginSuccess:[UserInfo new]];
            }else{
                [[[LoginModuleManager shared] dependency].coordinator onLoginFailure];
            }
        }];
    }]];
    [vc presentViewController:alert animated:true completion:nil];
}

- (void)onTapCloseBtnWith:(UIViewController *)vc{
    [[[LoginModuleManager shared] dependency].coordinator closeLoginFlow:self];
}

@end
