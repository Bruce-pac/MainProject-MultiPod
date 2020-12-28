//
//  PayFeatureModuleEvents.h
//  MainProject-MultiPod
//
//  Created by gxy on 2020/12/7.
//  Copyright © 2020 Bruce. All rights reserved.
//

#ifndef PayFeatureModuleEvents_h
#define PayFeatureModuleEvents_h

#import <Foundation/Foundation.h>
#import <LBCoordinator/UIResponder+LBCoordinating.h>

extern LBCoordinatorEventName const kPayModuleNeedLoginStateEvent;

// Desc: asyncHandler里面请传递登录状态Bool
extern LBCoordinatorEventName const kPayModuleToLoginModuleEvent;

#endif /* PayFeatureModuleEvents_h */
