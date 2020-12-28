//
//  AccountVM.m
//  MainProject-MultiPod
//
//  Created by gxy on 2019/11/1.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "AccountVM.h"


@interface AccountVM ()
@property (nonatomic, strong) NSMutableArray<UserNameListenser> *listeners;
@end

@implementation AccountVM

- (void)updateUserInfo:(AccountInfo *)info{
    NSAttributedString *name = [[NSAttributedString alloc] initWithString:@"Bruce" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:15]}];
    [self.listeners enumerateObjectsUsingBlock:^(UserNameListenser  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj(name);
    }];
}

- (void)subscribeUserName:(void (^)(NSAttributedString * _Nullable))listener{
    [self.listeners addObject:listener];
    listener(nil);
}

- (NSMutableArray *)listeners{
    if (!_listeners) {
        _listeners = [NSMutableArray array];
    }
    return _listeners;
}
@end
