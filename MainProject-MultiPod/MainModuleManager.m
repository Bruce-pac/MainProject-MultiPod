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
#import "BPHttpClient.h"
#import "AppCoordinator.h"

@implementation MainModuleManager
+ (void)injectAllDependencyWith:(AppCoordinator *)appFlow{

    [[ModuleManager shared] injectDependency:[[Dependency alloc] initWithCoordinator:appFlow]];
    [[LoginModuleManager shared] injectDependency:[[BPDependency alloc] initWithCoordinator:appFlow httpClient:[BPHttpClient new]]];
}
@end
