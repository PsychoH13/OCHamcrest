//
//  HCIsEqualToRect.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCRectAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_equalToCGRect(CGRect equalArg);

#ifdef HC_SHORTHAND
#define equalToCGRect HC_equalToCGRect
#endif

@interface HCIsEqualToCGRect : HCCGRectMatcher

+ (HCIsEqualToCGRect *)isEqualToCGRect:(CGRect)aRect;

@end

#else
#import <AppKit/AppKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_equalToRect(NSRect equalArg);

#ifdef HC_SHORTHAND
#define equalToRect HC_equalToRect
#endif

@interface HCIsEqualToRect : HCRectMatcher

+ (HCIsEqualToRect *)isEqualToRect:(NSRect)aRect;

@end

#endif
