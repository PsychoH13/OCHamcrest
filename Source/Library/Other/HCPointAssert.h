//
//  HCPointAssert.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCDefines.h"
#import "HCValueMatcher.h"

@protocol HCMatcher;

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

OCHAMCREST_EXPORT void HC_assertThatCGPointWithLocation(id testCase, CGPoint actual, id<HCMatcher> matcher, const char* fileName, int lineNumber);

#define HC_assertThatCGPoint(actual, matcher)  \
    HC_assertThatCGPointWithLocation(self, actual, matcher, __FILE__, __LINE__)

#ifdef HC_SHORTHAND
#define assertThatCGPoint HC_assertThatCGPoint
#endif

@interface HCCGPointMatcher : HCValueMatcher

+ (id)CGPointMatcherWithCGPoint:(CGPoint)aPoint;

@property(nonatomic, readonly) CGPoint CGPointValue;

@end

#else
#import <AppKit/AppKit.h>

OCHAMCREST_EXPORT void HC_assertThatPointWithLocation(id testCase, NSPoint actual, id<HCMatcher> matcher, const char* fileName, int lineNumber);

#define HC_assertThatPoint(actual, matcher)  \
    HC_assertThatPointWithLocation(self, actual, matcher, __FILE__, __LINE__)

#ifdef HC_SHORTHAND
#define assertThatPoint HC_assertThatPoint
#endif

@interface HCPointMatcher : HCValueMatcher

+ (id)pointMatcherWithPoint:(NSPoint)aPoint;

@property(nonatomic, readonly) NSPoint pointValue;

@end

#endif
