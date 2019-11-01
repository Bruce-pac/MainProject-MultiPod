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

@interface AppCoordinator ()<AccountViewControllerDelegate>
@property (nonatomic, weak) MainTabBarViewController *rootVC;
@property (nonatomic, strong) NSMutableArray<id<Coordinator>> *childCoordinators;
@property (nonatomic, strong) AccountVM *accountVM;//简单起见
@end

@implementation AppCoordinator

@dynamic rootVC;

- (void)start{
    UINavigationController *listNav = [UINavigationController new];
    id<Coordinator> listCoordinator = [[ListCoordinatorFactory new] makeCoordinatorWith:listNav];
    [listCoordinator start];
    listNav.topViewController.title = @"list";
    [self.childCoordinators addObject:listCoordinator];

    AccountVM *vm = [AccountVM new];
    self.accountVM = vm;
    AccountViewController *account = [[AccountViewController alloc] initWithViewModel:vm];
    account.delegate = self;
    account.title = @"account";
    self.rootVC.viewControllers = @[listNav, account];
}

-(NSMutableArray<id<Coordinator>> *)childCoordinators{
    if (!_childCoordinators) {
        _childCoordinators = [NSMutableArray array];
    }
    return _childCoordinators;
}

- (void)onTapAccountBtn:(nonnull AccountViewController *)vc {
    [self startLoginFlow];
}

- (void)startLoginFlow{
    UINavigationController *loginRoot = [UINavigationController new];
    LoginCoordinator *loginFlow = [[LoginCoordinator alloc] initWithRootVC:loginRoot];
    [self.childCoordinators addObject:loginFlow];
    [loginFlow start];
    [self.rootVC presentViewController:loginRoot animated:YES completion:nil];
}

@end

@implementation AppCoordinator (ListPodCoordinatorTypeImp)

- (void)jumpPayPageWithBased:(UIViewController * _Nonnull)vc with:(id _Nonnull)data {
    uint32_t num = arc4random();
    BOOL isLogin = num % 2;

    if (isLogin) {
        // TODO
        UIViewController *pay = [[UIStoryboard storyboardWithName:@"PayViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"PayViewController"];
        [vc.navigationController pushViewController:pay animated:YES];
    }else{
        [self startLoginFlow];
    }
}

@end

@implementation AppCoordinator (LoginCoordinatorDelegateImp)

- (void)closeLoginFlow:(LoginCoordinator *)loginFlow {
    [self.rootVC dismissViewControllerAnimated:YES completion:^{
        [self.childCoordinators removeObject:loginFlow];
    }];
}

- (void)onLoginFailure {
    NSLog(@"%s", __func__);
}

- (void)onLoginSuccess:(nonnull UserInfo *)info {
    [self.accountVM updateUserInfo:info];
}

@end
