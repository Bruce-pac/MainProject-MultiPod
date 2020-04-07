//
//  BPDependency.m
//  LoginPod
//
//  Created by gxy on 2019/9/15.
//

#import "BPDependency.h"

@interface BPDependency ()
@property (nonatomic, strong) id<LoginCoordinatorDelegate> coordinator;
@property (nonatomic, strong) id<LoginHttpClientType> httpClient;
@end

@implementation BPDependency
- (instancetype)initWithCoordinator:(id<LoginCoordinatorDelegate>)coordinator httpClient:(id<LoginHttpClientType>)httpClient{
    self = [super init];
    if (self) {
        _coordinator = coordinator;
        _httpClient = httpClient;
    }
    return self;
}
@end
