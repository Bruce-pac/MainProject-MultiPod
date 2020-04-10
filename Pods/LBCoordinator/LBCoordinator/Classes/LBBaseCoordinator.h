//
//  LBBaseCoordinator.h
//  Tendaisy
//
//  Created by Bruce on 2019/12/3.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBCoordinating.h"
#import "UIResponder+LBCoordinating.h"

NS_ASSUME_NONNULL_BEGIN
/*
 @abstract class.
 一般只需要重写 -start 方法。
 */
@interface LBBaseCoordinator : UIResponder<LBCoordinating>

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, strong, nullable) id<LBCoordinating> parentCoordinator;
///子类coordinator所负责的业务流结束之后主动调用，父coordinator在此回调里释放子coordinator,以及一些额外的操作
@property (nonatomic, copy, nullable) void (^didCompleted)(__kindof LBBaseCoordinator *coordinator);

- (void)start;

- (void)startChildCoordinator:(id<LBCoordinating>)child;
- (void)stopChildCoordinator:(id<LBCoordinating>)child;
- (void)addChildCoordinator:(id<LBCoordinating>)child;
@end

NS_ASSUME_NONNULL_END
