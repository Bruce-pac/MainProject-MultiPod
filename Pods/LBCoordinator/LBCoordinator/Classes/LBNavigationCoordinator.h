//
//  LBNavigationCoordinator.h
//  Tendaisy
//
//  Created by Bruce on 2019/12/3.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "LBGenericCoordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface LBNavigationCoordinator : LBBaseCoordinator<UINavigationControllerDelegate>
@property (nonatomic, strong, readonly) __kindof UINavigationController *rootVC;

- (instancetype)initWithRootVC:(__kindof UINavigationController *)rootVC;

- (void)presentViewController:(UIViewController *)viewController
                     animated: (BOOL)flag
                   completion:(void (^ _Nullable)(void))completion;
- (void)dismissViewControllerAnimated: (BOOL)flag
                           completion: (void (^ _Nullable)(void))completion;

/// pop完成后的回调，子类可以重写
/// @param toViewController pop完成后显示的控制器
/// @param fromViewController 被pop的控制器
- (void)didPopTransitionToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController;
@end

NS_ASSUME_NONNULL_END
