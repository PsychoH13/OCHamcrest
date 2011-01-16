//
//  HCInfiniteRect.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCRectAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_infiniteCGRect(void);

#ifdef HC_SHORTHAND
#define infiniteCGRect HC_infiniteCGRect
#endif

@interface HCInfiniteCGRect : HCCGRectMatcher

+ (HCInfiniteCGRect *)infiniteCGRect;

@end

#else
#import <AppKit/AppKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_infiniteRect(void);

#ifdef HC_SHORTHAND
#define infiniteRect HC_infiniteRect
#endif

@interface HCInfiniteRect : HCRectMatcher

+ (HCInfiniteRect *)infiniteRect;

@end

#endif
