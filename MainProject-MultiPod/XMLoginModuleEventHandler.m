//
//  XMLoginModuleEventHandler.m
//  MainProject-MultiPod
//
//  Created by gxy on 2020/12/20.
//  Copyright © 2020 Bruce. All rights reserved.
//

#import "XMLoginModuleEventHandler.h"
@import LoginPod;

@implementation XMLoginModuleEventHandler
- (void)handleEvent:(LBCoordinatorEventName)event object:(id)object userInfo:(NSDictionary *)userInfo asyncHandler:(void (^)(id _Nullable))asyncHandler{
    
}

- (NSArray<LBCoordinatorEventName> *)eventsCanBeHandled {
    return @[
        kLoginModuleLoginStateChangeEvent
    ];
}

@end
