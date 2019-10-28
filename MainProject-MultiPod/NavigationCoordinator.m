//
//  NavigationCoordinator.m
//  MainProject-MultiPod
//
//  Created by gxy on 2019/10/28.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "NavigationCoordinator.h"

@implementation NavigationCoordinator
- (instancetype)initWithRootNavVC:(UINavigationController *)rootNav{
    self = [super init];
    if (self) {
        _rootNav = rootNav;
    }
    return self;
}

- (void)start{
    NSAssert(NO, @"subclass must imp this method");
}
@end
