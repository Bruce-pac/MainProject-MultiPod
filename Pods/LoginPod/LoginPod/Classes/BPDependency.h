//
//  BPDependency.h
//  LoginPod
//
//  Created by gxy on 2019/9/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class UserInfo, LoginCoordinator;
@protocol LoginCoordinatorDelegate <NSObject>
-(void)onLoginSuccess:(UserInfo *)info;
-(void)onLoginFailure;
-(void)closeLoginFlow:(LoginCoordinator *)loginFlow;
@end

@protocol LoginHttpClientType <NSObject>
-(void)requestApi:(NSString *)url
            param:(NSDictionary *)parameter
          success:(void (^)(void))success
          failure:(void (^)(void))failure;
@end

@interface BPDependency : NSObject
@property (nonatomic, strong, readonly) id<LoginCoordinatorDelegate> coordinator;
@property (nonatomic, strong, readonly) id<LoginHttpClientType> httpClient;
-(instancetype)initWithCoordinator:(id<LoginCoordinatorDelegate>)coordinator
                        httpClient:(id<LoginHttpClientType>)httpClient;
@end

NS_ASSUME_NONNULL_END
