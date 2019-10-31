//
//  LoginViewModel.h
//  LoginPod
//
//  Created by 顾鑫烨 on 2019/10/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject
- (void)loginWithCompletion:(void (^)(BOOL success))completion;
@end

NS_ASSUME_NONNULL_END
