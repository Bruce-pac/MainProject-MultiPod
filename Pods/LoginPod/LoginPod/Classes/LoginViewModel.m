//
//  LoginViewModel.m
//  LoginPod
//
//  Created by 顾鑫烨 on 2019/10/30.
//

#import "LoginViewModel.h"
#import "LoginModuleManager.h"

@implementation LoginViewModel
- (void)loginWithCompletion:(void (^)(BOOL))completion{
    [[LoginModuleManager shared].dependency.httpClient requestApi:@"loginapi" param:@{} success:^{
        if (completion) {
            completion(YES);
        }
    } failure:^{
        if (completion) {
            completion(NO);
        }
    }];
}
@end
