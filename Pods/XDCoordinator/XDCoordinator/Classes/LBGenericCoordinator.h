//
//  LBGenericCoordinator.h
//  Tendaisy
//
//  Created by Bruce on 2019/12/5.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "LBBaseCoordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface LBGenericCoordinator<T: UIViewController *> : LBBaseCoordinator
@property (nonatomic, strong, readonly) T rootVC;
- (instancetype)initWithRootVC:(T)rootVC;
@end

NS_ASSUME_NONNULL_END
