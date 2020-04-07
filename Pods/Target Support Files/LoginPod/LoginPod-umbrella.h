#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BPDependency.h"
#import "LoginCoordinator.h"
#import "LoginModuleManager.h"
#import "UserInfo.h"

FOUNDATION_EXPORT double LoginPodVersionNumber;
FOUNDATION_EXPORT const unsigned char LoginPodVersionString[];

