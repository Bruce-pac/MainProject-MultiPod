//
//  PayViewModel.h
//  MainProject-MultiPod
//
//  Created by gxy on 2020/4/10.
//  Copyright © 2020 Bruce. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PayViewModel : NSObject
- (void)subscribePayStatus:(void (^)(BOOL status))subscriber;
- (void)payWithId:(NSInteger)pId;
@end

NS_ASSUME_NONNULL_END
