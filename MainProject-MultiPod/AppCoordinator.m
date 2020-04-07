//
//  AppCoordinator.m
//  MainProject-MultiPod
//
//  Created by gxy on 2019/10/28.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "AppCoordinator.h"
#import <ListPod/ListPod-Swift.h>
#import <LoginCoordinator.h>
#import "AccountViewController.h"
#import "PayViewController.h"

@interface AppCoordinator ()<AccountViewControllerDelegate>
@property (nonatomic, weak) MainTabBarViewController *rootVC;
@property (nonatomic, strong) AccountVM *accountVM;//简单起见
@end

@implementation AppCoordinator

@dynamic rootVC;

- (void)start{
    UINavigationController *listNav = [UINavigationController new];
    ListCoordinator *listCoordinator = [[ListCoordinator alloc] initWithRootVC:listNav];
    [self startChildCoordinator:listCoordinator];

    AccountVM *vm = [AccountVM new];
    self.accountVM = vm;
    AccountViewController *account = [[AccountViewController alloc] initWithViewModel:vm];
    account.delegate = self;
    account.title = @"account";
    listNav.title = @"list";
    self.rootVC.viewControllers = @[listNav, account];
}

- (void)onTapAccountBtn:(nonnull AccountViewController *)vc {
    [self startLoginFlow];
}

- (void)startLoginFlow{
    UINavigationController *loginRoot = [UINavigationController new];
    LoginCoordinator *loginFlow = [[LoginCoordinator alloc] initWithRootVC:loginRoot];
    [self startChildCoordinator:loginFlow];
    [self.rootVC presentViewController:loginRoot animated:YES completion:nil];
}

@end

@implementation AppCoordinator (ListPodCoordinatorTypeImp)

- (void)listCoordinator:(ListCoordinator *)coordinator jumpPayPageWith:(ListItemOC *)data{
    uint32_t num = arc4random();
    BOOL isLogin = num % 2;

    if (isLogin) {
        // TODO
        PayViewController *pay = [[UIStoryboard storyboardWithName:@"PayViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"PayViewController"];
        pay.pId = data.pId;
        NSLog(@"%ld",(long)data.pId);
        [coordinator.rootVC pushViewController:pay animated:YES];
    }else{
        [self startLoginFlow];
    }
}

@end

@implementation AppCoordinator (LoginCoordinatorDelegateImp)

- (void)loginFlowOnTapClose:(LoginCoordinator *)loginFlow{
    [self.rootVC dismissViewControllerAnimated:YES completion:^{
        [self stopChildCoordinator:loginFlow];
    }];
}

- (void)loginFlowOnFailure:(LoginCoordinator *)loginFlow{
    [self stopChildCoordinator:loginFlow];
}

- (void)loginFlow:(LoginCoordinator *)loginFlow onLoginSuccess:(UserInfo *)info{
    [self.accountVM updateUserInfo:info];
    [self stopChildCoordinator:loginFlow];
}

@end
