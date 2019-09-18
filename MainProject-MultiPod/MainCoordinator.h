//
//  MainCoordinator.h
//  MainProject-MultiPod
//
//  Created by gxy on 2019/9/18.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ListPod-Swift.h>
#import <LoginPod/BPDependency.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainCoordinator : NSObject<LoginCoordinatorType, ListPodCoordinatorType>

@end

NS_ASSUME_NONNULL_END
