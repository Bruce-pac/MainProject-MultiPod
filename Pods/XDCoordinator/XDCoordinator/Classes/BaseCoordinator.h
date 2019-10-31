//
//  BaseCoordinator.h
//  MainProject-MultiPod
//
//  Created by 顾鑫烨 on 2019/10/30.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Coordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseCoordinator<T: UIViewController *> : NSObject<Coordinator>
@property (nonatomic, weak, readonly) T rootVC;
- (instancetype)initWithRootVC:(T)rootVC;
@end

NS_ASSUME_NONNULL_END
