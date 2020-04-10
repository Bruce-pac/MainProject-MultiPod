//
//  PayViewModel.m
//  MainProject-MultiPod
//
//  Created by gxy on 2020/4/10.
//  Copyright © 2020 Bruce. All rights reserved.
//

#import "PayViewModel.h"

typedef void(^PayStatusSubscriber)(BOOL userName);

@interface PayViewModel ()
@property (nonatomic, strong) NSMutableArray<PayStatusSubscriber> *subscribers;
@end

@implementation PayViewModel
- (void)subscribePayStatus:(void (^)(BOOL))subscriber{
    [self.subscribers addObject:subscriber];
}

- (void)payWithId:(NSInteger)pId{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        uint32_t num = arc4random();
        [self.subscribers enumerateObjectsUsingBlock:^(PayStatusSubscriber  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            BOOL status = num % 2;
            obj(status);
        }];
    });
}

- (NSMutableArray<PayStatusSubscriber> *)subscribers{
    if (!_subscribers) {
        _subscribers = [NSMutableArray array];
    }
    return _subscribers;
}
@end
