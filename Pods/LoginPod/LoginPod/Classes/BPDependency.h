//
//  BPDependency.h
//  LoginPod
//
//  Created by gxy on 2019/9/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class UserInfo;
@protocol LoginCoordinatorType <NSObject>
-(void)loginSuccess:(UserInfo *)info based:(UIViewController *)vc;
-(void)loginFailureBased:(UIViewController *)vc;
@end

@protocol LoginHttpClientType <NSObject>
-(void)requestApi:(NSString *)url
            param:(NSDictionary *)parameter
          success:(void (^)(void))success
          failure:(void (^)(void))failure;
@end

@interface BPDependency : NSObject
@property (nonatomic, strong, readonly) id<LoginCoordinatorType> coordinator;
@property (nonatomic, strong, readonly) id<LoginHttpClientType> httpClient;
-(instancetype)initWithCoordinator:(id<LoginCoordinatorType>)coordinator
                        httpClient:(id<LoginHttpClientType>)httpClient;
@end

NS_ASSUME_NONNULL_END
