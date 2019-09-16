//
//  LoginModuleManager.h
//  LoginPod
//
//  Created by gxy on 2019/9/15.
//

#import <Foundation/Foundation.h>
#import "BPDependency.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginModuleManager : NSObject
@property (nonatomic, strong, readonly) BPDependency *dependency;
+(NSBundle *)resourceBundle;
+ (instancetype)shared;
- (void)injectDependency:(BPDependency *)dependency;
@end

NS_ASSUME_NONNULL_END
