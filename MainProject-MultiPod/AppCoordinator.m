//
//  AppCoordinator.m
//  MainProject-MultiPod
//
//  Created by gxy on 2019/10/28.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "AppCoordinator.h"
#import <ListPod/ListPod-Swift.h>

@interface AppCoordinator ()
//@property (nonatomic, strong) UIViewController *rootViewController;
@end

@implementation AppCoordinator

//- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
//    self = [super init];
//    if (self) {
//        _rootViewController = rootViewController;
//    }
//    return self;
//}

- (void)start{
    ListViewController *vc = [ListViewController new];

    [self.rootNav pushViewController:vc animated:true];
    
}
@end
