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

#import "BaseCoordinator.h"
#import "Coordinator.h"
#import "NavigationCoordinator.h"

FOUNDATION_EXPORT double XDCoordinatorVersionNumber;
FOUNDATION_EXPORT const unsigned char XDCoordinatorVersionString[];

