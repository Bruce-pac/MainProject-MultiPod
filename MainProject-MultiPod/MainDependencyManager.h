//
//  MainModuleManager.h
//  MainProject-MultiPod
//
//  Created by gxy on 2019/9/18.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BPHttpClient.h"

NS_ASSUME_NONNULL_BEGIN

@class AppCoordinator;

@interface MainDependencyManager : NSObject

+ (BPHttpClient *)httpClient;
@end

NS_ASSUME_NONNULL_END
