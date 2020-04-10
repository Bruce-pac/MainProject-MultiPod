//
//  UIResponder+LBCoordinator.h
//  Tendaisy
//
//  Created by Bruce on 2019/12/3.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString* LBCoordinatorEventName NS_TYPED_EXTENSIBLE_ENUM;

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (LBCoordinating)
@property (nonatomic, readonly) UIResponder *coordinatingResponder;

- (void)lb_coordinatingMessage:(LBCoordinatorEventName)event
                        object:(nullable id)object
                      userInfo:(nullable NSDictionary *)userInfo;
@end

NS_ASSUME_NONNULL_END
