//
//  HCRangeAssert.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCRangeAssert.h"

#import "HCDescription.h"
#import "HCMatcherAssert.h"

void HC_assertThatRangeWithLocation(id testCase, NSRange actual, id<HCMatcher> matcher, const char* fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithRange:actual], matcher, fileName, lineNumber);
}


@implementation HCRangeMatcher

+ (id)rangeMatcherWithRange:(NSRange)aRange;
{
    return [self valueMatcherWithValue:[NSValue valueWithRange:aRange]];
}

- (NSRange)rangeValue
{
    return [[self valueObject] rangeValue];
}

@end
