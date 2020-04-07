//
//  Coordinator.h
//  MainProject-MultiPod
//
//  Created by gxy on 2019/10/28.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LBCoordinating <NSObject>
@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, strong, nullable) id<LBCoordinating> parentCoordinator;
@property (nonatomic, copy, readonly) NSArray<id<LBCoordinating>> *childCoordinators;

- (void)start;
- (void)startChildCoordinator:(id<LBCoordinating>)child;
- (void)stopChildCoordinator:(id<LBCoordinating>)child;
- (void)addChildCoordinator:(id<LBCoordinating>)child;
@end

NS_ASSUME_NONNULL_END
