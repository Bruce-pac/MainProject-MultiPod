//
//  LBNavigationCoordinator.m
//  Tendaisy
//
//  Created by Bruce on 2019/12/3.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "LBNavigationCoordinator.h"
#import "UIViewController+LBCoordinator.h"

@interface LBNavigationCoordinator ()
@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, strong, readwrite) __kindof UINavigationController *rootVC;
@end

@implementation LBNavigationCoordinator

- (instancetype)initWithRootVC:(__kindof UINavigationController *)rootVC {
    self = [super init];
    if (self) {
        _rootVC = rootVC;
        _rootVC.lb_coordinator = self;
        _rootVC.delegate = self;
    }
    return self;
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ _Nullable)(void))completion{
    viewControllerToPresent.lb_coordinator = self;
    [self.rootVC presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (void)dismissViewControllerAnimated: (BOOL)flag completion: (void (^ _Nullable)(void))completion{
    [self.rootVC dismissViewControllerAnimated:flag completion:completion];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIViewController *fromViewController = [navigationController.transitionCoordinator viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (!fromViewController) {
        return;
    }
    if ([navigationController.viewControllers containsObject:fromViewController]) {
        return;
    }
    [self didPopTransitionToViewController:viewController fromViewController:fromViewController];
}

- (void)didPopTransitionToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController{
    
}

@end
