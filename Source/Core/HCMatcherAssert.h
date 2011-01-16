//
//  OCHamcrest - HCMatcherAssert.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCDefines.h"

@protocol HCMatcher;

@class NSException, NSString;


OCHAMCREST_EXPORT void HC_assertThatWithLocation(id testCase, id actual, id<HCMatcher> matcher, const char* fileName, int lineNumber);

OCHAMCREST_EXPORT NSException *HCCreateAssertThatFailure(const char *fileName, int lineNumber, NSString *description);

/**
    OCUnit integration asserting that actual value satisfies matcher.
*/
#define HC_assertThat(actual, matcher)  \
    HC_assertThatWithLocation(self, actual, matcher, __FILE__, __LINE__)


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_assertThat, available if HC_SHORTHAND is defined.
*/
#define assertThat HC_assertThat

#endif
