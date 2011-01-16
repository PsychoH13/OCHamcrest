//
//  HCPointerAssert.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCDefines.h"
#import "HCBaseMatcher.h"

OCHAMCREST_EXPORT void HC_assertThatPointerWithLocation(id testCase, void *actual, id<HCMatcher> matcher, const char* fileName, int lineNumber);


#define HC_assertThatPointer(actual, matcher)  \
HC_assertThatPointerWithLocation(self, actual, matcher, __FILE__, __LINE__)


#ifdef HC_SHORTHAND
#define assertThatPointer HC_assertThatPointer
#endif

@interface HCPointerMatcher : HCBaseMatcher
{
@private
    void *_pointer;
}

+ (id)pointerMatcherWithPointer:(void *)aPointer;
- (id)initWithPointer:(void *)aPointer;

@property(nonatomic, readonly) void *pointerValue;

@end

