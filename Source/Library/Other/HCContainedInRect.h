//
//  HCContainedInRect.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCRectAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_containedInCGRect(CGRect equalArg);

#ifdef HC_SHORTHAND
#define containedInCGRect HC_containedInCGRect
#endif

@interface HCContainedInCGRect : HCCGRectMatcher

+ (HCContainedInCGRect *)containedInCGRect:(CGRect)aRect;

@end

#else
#import <AppKit/AppKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_containedInRect(NSRect equalArg);

#ifdef HC_SHORTHAND
#define containedInRect HC_containedInRect
#endif

@interface HCContainedInRect : HCRectMatcher

+ (HCContainedInRect *)containedInRect:(NSRect)aRect;

@end

#endif
