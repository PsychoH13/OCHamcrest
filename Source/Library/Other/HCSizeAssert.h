//
//  HCSizeAssert.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCValueMatcher.h"

@protocol HCMatcher;

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

OCHAMCREST_EXPORT void HC_assertThatCGSizeWithLocation(id testCase, CGSize actual, id<HCMatcher> matcher, const char* fileName, int lineNumber);

#define HC_assertThatCGSize(actual, matcher)  \
    HC_assertThatCGSizeWithLocation(self, actual, matcher, __FILE__, __LINE__)

#ifdef HC_SHORTHAND
#define assertThatCGSize HC_assertThatCGSize
#endif

@interface HCCGSizeMatcher : HCValueMatcher

+ (id)CGSizeMatcherWithCGSize:(CGSize)aSize;

@property(nonatomic, readonly) CGSize CGSizeValue;

@end

#else
#import <AppKit/AppKit.h>

OCHAMCREST_EXPORT void HC_assertThatSizeWithLocation(id testCase, NSSize actual, id<HCMatcher> matcher, const char* fileName, int lineNumber);

#define HC_assertThatSize(actual, matcher)  \
    HC_assertThatSizeWithLocation(self, actual, matcher, __FILE__, __LINE__)

#ifdef HC_SHORTHAND
#define assertThatSize HC_assertThatSize
#endif

@interface HCSizeMatcher : HCValueMatcher

+ (id)sizeMatcherWithSize:(NSSize)aSize;

@property(nonatomic, readonly) NSSize sizeValue;

@end

#endif
