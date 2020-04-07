//
//  LoginModuleManager.m
//  LoginPod
//
//  Created by gxy on 2019/9/15.
//

#import "LoginModuleManager.h"

@interface LoginModuleManager ()
@property (nonatomic, strong) BPDependency *dependency;
@end

@implementation LoginModuleManager
+(NSBundle *)resourceBundle{
    static NSBundle *imageBundle = nil;
    if (!imageBundle) {
        NSBundle *pod = [NSBundle bundleForClass:[self class]];
        NSURL *url = [pod URLForResource:@"LoginPod" withExtension:@"bundle"];
        imageBundle = [NSBundle bundleWithURL:url];
    }
    return imageBundle;
}

+ (instancetype)shared{
    static LoginModuleManager *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [LoginModuleManager new];
    });
    return shared;
}

- (void)injectDependency:(BPDependency *)dependency{
    self.dependency = dependency;
}
@end
