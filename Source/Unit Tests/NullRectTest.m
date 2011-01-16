//
//  NullRectTest.m
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
#import "HCNullRect.h"

@interface NullRectTest : AbstractMatcherTest
@end

@implementation NullRectTest

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

- (id<HCMatcher>)createMatcher
{
    return nullCGRect();
}

- (void)testMatchesANullRectangle
{
    assertMatches(@"should match a null rectangle", [self createMatcher], ([NSValue valueWithCGRect:CGRectIntersection(CGRectMake(0, 0, 5, 5), CGRectMake(10, 10, 5, 5))]));
}

- (void)testDoesNotMatchANonNullRectangle
{
    assertDoesNotMatch(@"should not match a rectangle that is not null", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(7, 7, 2, 2)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"null rect", [self createMatcher]);
}

#else

- (id<HCMatcher>)createMatcher
{
    return nullRect();
}

- (void)testMatchesANullRectangle
{
    assertMatches(@"should match a null rectangle", [self createMatcher], ([NSValue valueWithRect:NSIntersectionRect(NSMakeRect(0, 0, 5, 5), NSMakeRect(10, 10, 5, 5))]));
}

- (void)testDoesNotMatchANonNullRectangle
{
    assertDoesNotMatch(@"should not match a rectangle that is not null", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(7, 7, 2, 2)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"null rect", [self createMatcher]);
}

#endif

@end
