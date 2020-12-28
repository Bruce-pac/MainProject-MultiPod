//
//  AccountCoordinator.m
//  MainProject-MultiPod
//
//  Created by gxy on 2020/4/7.
//  Copyright © 2020 Bruce. All rights reserved.
//

#import "AccountCoordinator.h"
#import "AccountViewController.h"

@interface AccountCoordinator ()<AccountViewControllerDelegate>
@property (nonatomic, strong) AccountVM *accountVM;//简单起见
@end

@implementation AccountCoordinator

- (void)startWithOptions:(NSDictionary *)options{
    [super startWithOptions:options];
    AccountVM *vm = [AccountVM new];
    self.accountVM = vm;
    AccountViewController *account = [[AccountViewController alloc] initWithViewModel:vm];
    account.delegate = self;
    account.title = @"account";
    [self pushViewController:account animated:NO];
}

- (void)onTapAccountBtn:(nonnull AccountViewController *)vc {
    [self.delegate accountCoordinatorOnTapAvatar:self];
}

- (void)updateUserInfo:(AccountInfo *)info{
    [self.accountVM updateUserInfo:info];
}

@end
