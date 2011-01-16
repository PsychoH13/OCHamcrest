//
//  HCRectAssert.h
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

OCHAMCREST_EXPORT void HC_assertThatCGRectWithLocation(id testCase, CGRect actual, id<HCMatcher> matcher, const char* fileName, int lineNumber);

#define HC_assertThatCGRect(actual, matcher)  \
    HC_assertThatCGRectWithLocation(self, actual, matcher, __FILE__, __LINE__)

#ifdef HC_SHORTHAND
#define assertThatCGRect HC_assertThatCGRect
#endif

@interface HCCGRectMatcher : HCValueMatcher

+ (id)CGRectMatcherWithCGRect:(CGRect)aRect;

@property(nonatomic, readonly) CGRect CGRectValue;

@end

#else
#import <AppKit/AppKit.h>

OCHAMCREST_EXPORT void HC_assertThatRectWithLocation(id testCase, NSRect actual, id<HCMatcher> matcher, const char* fileName, int lineNumber);

#define HC_assertThatRect(actual, matcher)  \
    HC_assertThatRectWithLocation(self, actual, matcher, __FILE__, __LINE__)

#ifdef HC_SHORTHAND
#define assertThatRect HC_assertThatRect
#endif

@interface HCRectMatcher : HCValueMatcher

+ (id)rectMatcherWithRect:(NSRect)aRect;

@property(nonatomic, readonly) NSRect rectValue;

@end

#endif
