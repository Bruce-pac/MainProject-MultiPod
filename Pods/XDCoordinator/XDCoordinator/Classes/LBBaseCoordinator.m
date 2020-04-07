//
//  LBBaseCoordinator.m
//  Tendaisy
//
//  Created by Bruce on 2019/12/3.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "LBBaseCoordinator.h"
#import "UIViewController+LBCoordinator.h"

@interface LBBaseCoordinator ()
@property (nonatomic, copy, readwrite) NSString *identifier;
@property (nonatomic, strong) NSMutableDictionary<NSString *, id<LBCoordinating>> *childCoordinatorContainer;

@end

@implementation LBBaseCoordinator

- (void)start{
    NSAssert(NO, @"%@ not implementated '-(void)start'", [self class]);
}

- (void)addChildCoordinator:(id<LBCoordinating>)child{
    [self.childCoordinatorContainer setObject:child forKey:child.identifier];
    child.parentCoordinator = self;
}

- (void)startChildCoordinator:(id<LBCoordinating>)child{
    [self addChildCoordinator:child];
    [child start];
}

- (void)stopChildCoordinator:(id<LBCoordinating>)child{
    child.parentCoordinator = nil;
    [self.childCoordinatorContainer removeObjectForKey:child.identifier];
}

- (NSArray<id<LBCoordinating>> *)childCoordinators{
    return self.childCoordinatorContainer.allValues;
}

- (UIResponder *)coordinatingResponder{
    return (UIResponder *)self.parentCoordinator;
}

#pragma mark - Lazy load

- (NSString *)identifier{
    if (!_identifier) {
        _identifier = NSStringFromClass([self class]);
    }
    return _identifier;
}

- (NSMutableDictionary<NSString *,id<LBCoordinating>> *)childCoordinatorContainer{
    if (!_childCoordinatorContainer) {
        _childCoordinatorContainer = [NSMutableDictionary dictionary];
    }
    return _childCoordinatorContainer;
}

@end
