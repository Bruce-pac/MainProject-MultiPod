//
//  PayViewController.m
//  MainProject-MultiPod
//
//  Created by gxy on 2019/9/18.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "PayViewController.h"

@interface PayViewController ()

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"viewDidLoad  %ld", (long)self.pId);
}

- (IBAction)onTapPay:(id)sender {
    [self.payViewModel payWithId:self.pId];
}


@end
