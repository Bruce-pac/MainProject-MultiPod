//
//  LoginViewController.m
//  LoginPod
//
//  Created by gxy on 2019/9/15.
//

#import "LoginViewController.h"
#import "LoginModuleManager.h"
#import "UserInfo.h"

@interface LoginViewController ()
@property (nonatomic, strong) UIActivityIndicatorView *netIndicator;
@property (nonatomic, strong) LoginViewModel *viewModel;
@end

@implementation LoginViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"LoginViewController" bundle:[LoginModuleManager resourceBundle]] instantiateInitialViewController];
    }
    return self;
}

- (instancetype)initWithViewModel:(LoginViewModel *)viewModel{
    self = [self init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.netIndicator.center = self.view.center;
    [self.view addSubview:self.netIndicator];
}

- (IBAction)signIn:(id)sender {
    [self.netIndicator startAnimating];
    [self.viewModel loginWithCompletion:^(BOOL success) {
        [self.netIndicator stopAnimating];
        if ([self.delegate respondsToSelector:@selector(loginResult:vc:)]) {
            [self.delegate loginResult:success vc:self];
        }
    }];
    
}
- (IBAction)onTapClose:(id)sender {
    if ([self.delegate respondsToSelector:@selector(onTapCloseBtnWith:)]) {
        [self.delegate onTapCloseBtnWith:self];
    }
}

-(UIActivityIndicatorView *)netIndicator{
    if (!_netIndicator) {
        _netIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    return _netIndicator;
}

@end
