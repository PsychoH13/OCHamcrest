//
//  HCNullRect.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCRectAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_nullCGRect(void);

#ifdef HC_SHORTHAND
#define nullCGRect HC_nullCGRect
#endif

@interface HCNullCGRect : HCCGRectMatcher

+ (HCNullCGRect *)nullCGRect;

@end

#else
#import <AppKit/AppKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_nullRect(void);

#ifdef HC_SHORTHAND
#define nullRect HC_nullRect
#endif

@interface HCNullRect : HCRectMatcher

+ (HCNullRect *)nullRect;

@end

#endif
