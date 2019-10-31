//
//  AppCoordinator.m
//  MainProject-MultiPod
//
//  Created by gxy on 2019/10/28.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "AppCoordinator.h"
#import <ListPod/ListPod-Swift.h>
//#import <LoginCoordinator.h>

@interface AppCoordinator ()
@property (nonatomic, strong) NSMutableArray<id<Coordinator>> *childCoordinators;
@end

@implementation AppCoordinator


- (void)start{
    UINavigationController *listNav = [UINavigationController new];
    id<Coordinator> listCoordinator = [[ListCoordinatorFactory new] makeCoordinatorWith:listNav];
    [listCoordinator start];
    [self.childCoordinators addObject:listCoordinator];
//    LoginCoordinator *loginCoordinator = [[LoginCoordinator alloc] initWithRootVC:[UINavigationController new]];
//    [self.childCoordinators addObject:loginCoordinator];
    self.rootVC.viewControllers = @[listNav];
}

-(NSMutableArray<id<Coordinator>> *)childCoordinators{
    if (!_childCoordinators) {
        _childCoordinators = [NSMutableArray array];
    }
    return _childCoordinators;
}

@end
