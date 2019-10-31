//
//  MainModuleManager.h
//  MainProject-MultiPod
//
//  Created by gxy on 2019/9/18.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class AppCoordinator;

@interface MainModuleManager : NSObject
+ (void)injectAllDependencyWith:(AppCoordinator *)appFlow;
@end

NS_ASSUME_NONNULL_END
