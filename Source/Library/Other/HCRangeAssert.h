//
//  HCRangeAssert.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCDefines.h"
#import "HCValueMatcher.h"

@protocol HCMatcher;

OCHAMCREST_EXPORT void HC_assertThatRangeWithLocation(id testCase, NSRange actual,
                                                      id<HCMatcher> matcher, const char* fileName, int lineNumber);

#define HC_assertThatRange(actual, matcher)  \
HC_assertThatRangeWithLocation(self, actual, matcher, __FILE__, __LINE__)

#ifdef HC_SHORTHAND
#define assertThatRange HC_assertThatRange
#endif

@interface HCRangeMatcher : HCValueMatcher

+ (id)rangeMatcherWithRange:(NSRange)aRange;

@property(nonatomic, readonly) NSRange rangeValue;

@end

