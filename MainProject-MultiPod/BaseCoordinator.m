//
//  BaseCoordinator.m
//  MainProject-MultiPod
//
//  Created by 顾鑫烨 on 2019/10/30.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "BaseCoordinator.h"

@interface BaseCoordinator ()
@property (nonatomic, weak) __kindof UIViewController *rootVC;
@end

@implementation BaseCoordinator

- (instancetype)initWithRootVC:(UIViewController *)rootVC{
    self = [super init];
    if (self) {
        _rootVC = rootVC;
    }
    return self;
}

- (void)start {
    NSAssert(NO, @"subclass must imp this method");
}

@end
