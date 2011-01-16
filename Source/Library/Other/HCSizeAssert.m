//
//  HCSizeAssert.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCSizeAssert.h"
#import "HCDescription.h"
#import "HCMatcherAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

void HC_assertThatCGSizeWithLocation(id testCase, CGSize actual, id<HCMatcher> matcher, const char* fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithCGSize:actual], matcher, fileName, lineNumber);
}

@implementation HCCGSizeMatcher

+ (id)CGSizeMatcherWithCGSize:(CGSize)aSize;
{
    return [self valueMatcherWithValue:[NSValue valueWithCGSize:aSize]];
}

- (CGSize)CGSizeValue
{
    return [[self valueObject] CGSizeValue];
}

@end

#else

void HC_assertThatSizeWithLocation(id testCase, NSSize actual, id<HCMatcher> matcher, const char* fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithSize:actual], matcher, fileName, lineNumber);
}

@implementation HCSizeMatcher

+ (id)sizeMatcherWithSize:(NSSize)aSize;
{
    return [self valueMatcherWithValue:[NSValue valueWithSize:aSize]];
}

- (NSSize)sizeValue
{
    return [[self valueObject] sizeValue];
}

@end

#endif
