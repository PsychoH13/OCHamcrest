//
//  HCRectAssert.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCRectAssert.h"
#import "HCDescription.h"
#import "HCMatcherAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

void HC_assertThatCGRectWithLocation(id testCase, CGRect actual, id<HCMatcher> matcher, const char* fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithCGRect:actual], matcher, fileName, lineNumber);
}

@implementation HCCGRectMatcher

+ (id)CGRectMatcherWithCGRect:(CGRect)aRect;
{
    return [self valueMatcherWithValue:[NSValue valueWithCGRect:aRect]];
}

- (CGRect)CGRectValue
{
    return [[self valueObject] CGRectValue];
}

@end

#else

void HC_assertThatRectWithLocation(id testCase, NSRect actual, id<HCMatcher> matcher, const char* fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithRect:actual], matcher, fileName, lineNumber);
}

@implementation HCRectMatcher

+ (id)rectMatcherWithRect:(NSRect)aRect;
{
    return [self valueMatcherWithValue:[NSValue valueWithRect:aRect]];
}

- (NSRect)rectValue
{
    return [[self valueObject] rectValue];
}

@end

#endif
