//
//  MainModuleManager.m
//  MainProject-MultiPod
//
//  Created by gxy on 2019/9/18.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "MainModuleManager.h"
#import <ListPod-Swift.h>
#import <LoginPod/LoginModuleManager.h>
#import "MainCoordinator.h"
#import "BPHttpClient.h"

@implementation MainModuleManager
+ (void)injectAllDependency{
    [[ModuleManager shared] injectDependency:[[Dependency alloc] initWithCoordinator:[MainCoordinator new]]];
    [[LoginModuleManager shared] injectDependency:[[BPDependency alloc] initWithCoordinator:[MainCoordinator new] httpClient:[BPHttpClient new]]];
}
@end
