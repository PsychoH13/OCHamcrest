//
//  HCIsEqualToSize.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCSizeAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_equalToCGSize(CGSize equalArg);

#ifdef HC_SHORTHAND
#define equalToCGSize HC_equalToCGSize
#endif

@interface HCIsEqualToCGSize : HCCGSizeMatcher

+ (HCIsEqualToCGSize *)isEqualToCGSize:(CGSize)aSize;

@end

#else
#import <AppKit/AppKit.h>

OCHAMCREST_EXPORT id<HCMatcher> HC_equalToSize(NSSize equalArg);

#ifdef HC_SHORTHAND
#define equalToSize HC_equalToSize
#endif

@interface HCIsEqualToSize : HCSizeMatcher

+ (HCIsEqualToSize *)isEqualToSize:(NSSize)aSize;

@end

#endif
