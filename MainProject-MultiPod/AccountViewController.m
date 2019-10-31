//
//  AccountViewController.m
//  MainProject-MultiPod
//
//  Created by gxy on 2019/10/31.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()
@property (weak, nonatomic) IBOutlet UIButton *userName;
@property (nonatomic, strong) AccountVM *vm;
@end

@implementation AccountViewController

- (instancetype)initWithViewModel:(AccountVM *)vm{
    self = [super initWithNibName:@"AccountViewController" bundle:nil];
    if (self) {
        _vm = vm;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak AccountViewController *weakSelf = self;
    [self.vm subscribeUserName:^(NSAttributedString * _Nullable userName) {
        [weakSelf.userName setAttributedTitle:userName forState:UIControlStateNormal];
    }];
}

- (IBAction)onTapHeadBtn:(id)sender {
    if ([self.delegate respondsToSelector:@selector(onTapAccountBtn:)]) {
        [self.delegate onTapAccountBtn:self];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
