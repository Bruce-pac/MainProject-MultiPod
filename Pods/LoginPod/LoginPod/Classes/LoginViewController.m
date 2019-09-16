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
@end

@implementation LoginViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"LoginViewController" bundle:[LoginModuleManager resourceBundle]] instantiateInitialViewController];
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
    [[LoginModuleManager shared].dependency.httpClient requestApi:@"loginApi" param:@{} success:^{
        [self.netIndicator stopAnimating];
        [[LoginModuleManager shared].dependency.coordinator loginSuccess:[UserInfo new] based:self];
    } failure:^{
        [self.netIndicator stopAnimating];
        [[LoginModuleManager shared].dependency.coordinator loginFailureBased:self];
    }];
}

-(UIActivityIndicatorView *)netIndicator{
    if (!_netIndicator) {
        _netIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    return _netIndicator;
}

@end
