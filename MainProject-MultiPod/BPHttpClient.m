//
//  BPHttpClient.m
//  LoginPod_Example
//
//  Created by gxy on 2019/9/15.
//  Copyright © 2019 Bruce-pac. All rights reserved.
//

#import "BPHttpClient.h"

@implementation BPHttpClient
- (void)requestApi:(NSString *)url param:(NSDictionary *)parameter success:(void (^)(void))success failure:(void (^)(void))failure{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        uint32_t num = arc4random();
        if (num % 2 == 0) {
            success();
        }else{
            failure();
        }
    });
}
@end
