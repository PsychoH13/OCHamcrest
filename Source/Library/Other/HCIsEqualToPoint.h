//
//  HCIsEqualToPoint.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCPointAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_equalToCGPoint(CGPoint equalArg);

#ifdef HC_SHORTHAND
#define equalToCGPoint HC_equalToCGPoint
#endif

@interface HCIsEqualToCGPoint : HCCGPointMatcher

+ (HCIsEqualToCGPoint *)isEqualToCGPoint:(CGPoint)aPoint;

@end

#else
#import <AppKit/AppKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_equalToPoint(NSPoint equalArg);

#ifdef HC_SHORTHAND
#define equalToPoint HC_equalToPoint
#endif

@interface HCIsEqualToPoint : HCPointMatcher

+ (HCIsEqualToPoint *)isEqualToPoint:(NSPoint)aPoint;

@end

#endif
