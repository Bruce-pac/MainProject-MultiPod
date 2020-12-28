//
//  MainModuleManager.m
//  MainProject-MultiPod
//
//  Created by gxy on 2019/9/18.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "MainDependencyManager.h"
#import <ListPod-Swift.h>
#import "BPHttpClient.h"
#import "AppCoordinator.h"

@implementation MainDependencyManager

+ (BPHttpClient *)httpClient {
    return [BPHttpClient new];
}

@end
