//
//  HCEmptyRect.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCRectAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_emptyCGRect(void);

#ifdef HC_SHORTHAND
#define emptyCGRect HC_emptyCGRect
#endif

@interface HCEmptyCGRect : HCCGRectMatcher

+ (HCEmptyCGRect *)emptyCGRect;

@end

#else
#import <AppKit/AppKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_emptyRect(void);

#ifdef HC_SHORTHAND
#define emptyRect HC_emptyRect
#endif

@interface HCEmptyRect : HCRectMatcher

+ (HCEmptyRect *)emptyRect;

@end

#endif
