//
//  EmptyRectTest.m
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
#import "HCEmptyRect.h"

@interface EmptyRectTest : AbstractMatcherTest
@end

@implementation EmptyRectTest

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

- (id<HCMatcher>)createMatcher
{
    return emptyCGRect();
}

- (void)testMatchesAnEmptyRectangle
{
    assertMatches(@"should match an empty rectangle", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(10, 10, 0, 0)]));
}

- (void)testDoesNotMatchAnNonEmptyRectangle
{
    assertDoesNotMatch(@"should not match a rectangle that is not empty", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(7, 7, 2, 2)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"empty rect", [self createMatcher]);
}

#else

- (id<HCMatcher>)createMatcher
{
    return emptyRect();
}

- (void)testMatchesAnEmptyRectangle
{
    assertMatches(@"should match an empty rectangle", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(10, 10, 0, 0)]));
}

- (void)testDoesNotMatchAnNonEmptyRectangle
{
    assertDoesNotMatch(@"should not match a rectangle that is not empty", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(7, 7, 2, 2)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"empty rect", [self createMatcher]);
}

#endif

@end
