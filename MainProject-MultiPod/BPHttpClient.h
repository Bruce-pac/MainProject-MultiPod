//
//  BPHttpClient.h
//  LoginPod_Example
//
//  Created by gxy on 2019/9/15.
//  Copyright © 2019 Bruce-pac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BPDependency.h>

NS_ASSUME_NONNULL_BEGIN

@interface BPHttpClient : NSObject<LoginHttpClientType>
-(void)requestApi:(NSString *)url param:(NSDictionary *)parameter success:(void (^)(void))success failure:(void (^)(void))failure;
@end

NS_ASSUME_NONNULL_END
