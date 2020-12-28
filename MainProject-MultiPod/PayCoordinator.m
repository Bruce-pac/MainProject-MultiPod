//
//  PayCoordinator.m
//  MainProject-MultiPod
//
//  Created by gxy on 2020/4/7.
//  Copyright © 2020 Bruce. All rights reserved.
//

#import "PayCoordinator.h"
#import "PayViewController.h"

@interface PayCoordinator ()
@property (nonatomic, strong) PayViewController *entranceVC;
@end

@implementation PayCoordinator

- (void)startWithPId:(NSInteger)pId{
    [self startWithOptions:@{@"pId": @(pId)}];

}

- (void)startWithOptions:(NSDictionary *)options {
    NSNumber *pId = options[@"pId"];
    if (!pId) {
        return;
    }
    [super startWithOptions:options];

    PayViewController *pay = [[UIStoryboard storyboardWithName:@"PayViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"PayViewController"];
    PayViewModel *vm = [[PayViewModel alloc] init];
    pay.payViewModel = vm;
    pay.pId = pId.integerValue;
    __weak typeof(self) weakSelf = self;
    [vm subscribePayStatus:^(BOOL status) {
        __strong PayCoordinator* self = weakSelf;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:status ? @"支付成功": @"支付失败" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [self.rootVC presentViewController:alert animated:YES completion:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alert dismissViewControllerAnimated:YES completion:^{
                if (self.didCompleted) {
                    self.didCompleted(self);
                }
            }];
        });
    }];
    self.entranceVC = pay;
    [self pushViewController:pay animated:YES];

}

- (void)didPopTransitionToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController{
}
@end
