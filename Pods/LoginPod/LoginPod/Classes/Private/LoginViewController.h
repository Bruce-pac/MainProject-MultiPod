//
//  LoginViewController.h
//  LoginPod
//
//  Created by gxy on 2019/9/15.
//

#import <UIKit/UIKit.h>
#import <LoginViewModel.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LoginViewControllerDelegate <NSObject>

-(void)loginResult:(BOOL)result vc:(UIViewController *)vc;
-(void)onTapCloseBtnWith:(UIViewController *)vc;
@end

@interface LoginViewController : UIViewController
@property (nonatomic, weak) id<LoginViewControllerDelegate> delegate;
- (instancetype)initWithViewModel:(LoginViewModel *)viewModel;
@end

NS_ASSUME_NONNULL_END
