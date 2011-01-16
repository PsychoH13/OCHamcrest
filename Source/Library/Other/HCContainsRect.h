//
//  HCContainsRect.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCRectAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_containsCGRect(CGRect equalArg);

#ifdef HC_SHORTHAND
#define containsCGRect HC_containsCGRect
#endif

@interface HCContainsCGRect : HCCGRectMatcher

+ (HCContainsCGRect *)containsCGRect:(CGRect)aRect;

@end

#else
#import <AppKit/AppKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_containsRect(NSRect equalArg);

#ifdef HC_SHORTHAND
#define containsRect HC_containsRect
#endif

@interface HCContainsRect : HCRectMatcher

+ (HCContainsRect *)containsRect:(NSRect)aRect;

@end

#endif
