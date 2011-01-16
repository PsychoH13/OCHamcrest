//
//  IntersectsRectTest.m
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
#import "HCIntersectsRect.h"

@interface IntersectsRectTest : AbstractMatcherTest
@end

@implementation IntersectsRectTest

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

- (id<HCMatcher>)createMatcher
{
    return intersectsCGRect(CGRectMake(0, 0, 10, 10));
}

- (void)testMatchesARectangleThatIntersects
{
    assertMatches(@"should match rectangle that intersects", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(5, 5, 10, 10)]));
}

- (void)testMatchesARectangleThatContainsTheRectangle
{
    assertMatches(@"should match rectangle that contains the rectangle", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(-5, -5, 20, 20)]));
}

- (void)testMatchesARectangleThatIsContainedByTheRectangle
{
    assertMatches(@"should match rectangle that is contained by the rectangle", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(2, 2, 5, 5)]));
}

- (void)testDoesNotMatchARectangleThatIsOutside
{
    assertDoesNotMatch(@"should not match rectangle that is outside of the rectangle", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(12, 12, 5, 5)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"interescting with <CGRect: {{0, 0}, {10, 10}}>", [self createMatcher]);
}

#else

- (id<HCMatcher>)createMatcher
{
    return intersectsRect(NSMakeRect(0, 0, 10, 10));
}

- (void)testMatchesARectangleThatIntersectsAnother
{
    assertMatches(@"should match rectangle that intersects", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(5, 5, 10, 10)]));
}

- (void)testMatchesARectangleThatContainsTheRectangle
{
    assertMatches(@"should match rectangle that contains the rectangle", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(-5, -5, 20, 20)]));
}

- (void)testMatchesARectangleThatIsContainedByTheRectangle
{
    assertMatches(@"should match rectangle that is contained by the rectangle", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(2, 2, 5, 5)]));
}

- (void)testDoesNotMatchARectangleThatIsOutside
{
    assertDoesNotMatch(@"should not match rectangle that is outside of the rectangle", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(12, 12, 5, 5)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"interescting with <NSRect: {{0, 0}, {10, 10}}>", [self createMatcher]);
}

#endif

@end
