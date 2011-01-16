//
//  HCIntersectsRect.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCRectAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_intersectsCGRect(CGRect equalArg);

#ifdef HC_SHORTHAND
#define intersectsCGRect HC_intersectsCGRect
#endif

@interface HCIntersectsCGRect : HCCGRectMatcher

+ (HCIntersectsCGRect *)intersectsCGRect:(CGRect)aRect;

@end

#else
#import <AppKit/AppKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_intersectsRect(NSRect equalArg);

#ifdef HC_SHORTHAND
#define intersectsRect HC_intersectsRect
#endif

@interface HCIntersectsRect : HCRectMatcher

+ (HCIntersectsRect *)intersectsRect:(NSRect)aRect;

@end

#endif
