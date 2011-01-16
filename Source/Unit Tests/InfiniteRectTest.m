//
//  InfiniteRectTest.m
//  OCHamcrest
//
//  Created by Remy Demarest on 16/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//


#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>
#else
#import <AppKit/AppKit.h>
#endif

// Inherited
#import "AbstractMatcherTest.h"

// OCHamcrest
#define HC_SHORTHAND
#import "HCInfiniteRect.h"

@interface InfiniteRectTest : AbstractMatcherTest
@end

@implementation InfiniteRectTest

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

- (id<HCMatcher>)createMatcher
{
    return infiniteCGRect();
}

- (void)testMatchesAnInfiniteRectangle
{
    assertMatches(@"should match an infinite rectangle", [self createMatcher], ([NSValue valueWithCGRect:CGRectInfinite);
}

- (void)testDoesNotMatchAnNonInfiniteRectangle
{
    assertDoesNotMatch(@"should not match a rectangle that is not infinite", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(7, 7, 2, 2)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"infinite rect", [self createMatcher]);
}

#else

- (id<HCMatcher>)createMatcher
{
    return infiniteRect();
}

- (void)testMatchesAnInfiniteRectangle
{
    assertMatches(@"should match an infinite rectangle", [self createMatcher], ([NSValue valueWithRect:NSRectFromCGRect(CGRectInfinite)]));
}

- (void)testDoesNotMatchAnNonInfiniteRectangle
{
    assertDoesNotMatch(@"should not match a rectangle that is not infinite", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(7, 7, 2, 2)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"infinite rect", [self createMatcher]);
}

#endif

@end
