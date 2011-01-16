//
//  HCPointAssert.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCPointAssert.h"
#import "HCDescription.h"
#import "HCMatcherAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

void HC_assertThatCGPointWithLocation(id testCase, CGPoint actual, id<HCMatcher> matcher, const char* fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithCGPoint:actual], matcher, fileName, lineNumber);
}

@implementation HCCGPointMatcher
@synthesize CGPointValue = _point;

+ (id)CGPointMatcherWithCGPoint:(CGPoint)aPoint;
{
    return [self valueMatcherWithValue:[NSValue valueWithCGPoint:aPoint]];
}

- (NSPoint)pointValue
{
    return [[self objectValue] CGPointValue];
}

@end

#else

void HC_assertThatPointWithLocation(id testCase, NSPoint actual, id<HCMatcher> matcher, const char* fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithPoint:actual], matcher, fileName, lineNumber);
}

@implementation HCPointMatcher

+ (id)pointMatcherWithPoint:(NSPoint)aPoint;
{
    return [self valueMatcherWithValue:[NSValue valueWithPoint:aPoint]];
}

- (NSPoint)pointValue
{
    return [[self valueObject] pointValue];
}

@end

#endif
