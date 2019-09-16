//
//  BPDependency.m
//  LoginPod
//
//  Created by gxy on 2019/9/15.
//

#import "BPDependency.h"

@interface BPDependency ()
@property (nonatomic, strong) id<LoginCoordinatorType> coordinator;
@property (nonatomic, strong) id<LoginHttpClientType> httpClient;
@end

@implementation BPDependency
- (instancetype)initWithCoordinator:(id<LoginCoordinatorType>)coordinator httpClient:(id<LoginHttpClientType>)httpClient{
    self = [super init];
    if (self) {
        _coordinator = coordinator;
        _httpClient = httpClient;
    }
    return self;
}
@end
