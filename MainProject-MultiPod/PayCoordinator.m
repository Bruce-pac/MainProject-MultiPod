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

- (void)start{
    PayViewController *pay = [[UIStoryboard storyboardWithName:@"PayViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"PayViewController"];
    PayViewModel *vm = [[PayViewModel alloc] init];
    pay.payViewModel = vm;
    [vm subscribePayStatus:^(BOOL status) {
        if ([self.delegate respondsToSelector:@selector(payFlow:didFinishWithStatus:)]) {
            [self.delegate payFlow:self didFinishWithStatus:status];
        }
    }];
    self.entranceVC = pay;
    [self.rootVC pushViewController:pay animated:YES];
}

- (void)startWithPId:(NSInteger)pId{
    [self start];
    PayViewController *pay = (PayViewController *)self.rootVC.topViewController;
    pay.pId = pId;
}

- (void)didPopTransitionToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController{
    if (fromViewController == self.entranceVC) {
        if (self.didCompleted) {
            self.didCompleted(self);
        }
    }
}
@end
