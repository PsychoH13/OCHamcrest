//
//  ContainedInRectTest.m
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
#import "HCContainedInRect.h"

@interface ContainedInRectTest : AbstractMatcherTest
@end

@implementation ContainedInRectTest

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

- (id<HCMatcher>)createMatcher
{
    return containedInCGRect(CGRectMake(0, 0, 10, 10));
}

- (void)testMatchesARectangleThatContainedInAnother
{
    assertMatches(@"should match rectangle that containedIn", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(0, 0, 10, 10)]));
}

- (void)testDoesNotMatchARectangleThatIsInside
{
    assertDoesNotMatch(@"should not match a rectangle that is inside of the rectangle", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(7, 7, 2, 2)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"contained in <CGRect: {{0, 0}, {10, 10}}>", [self createMatcher]);
}

#else

- (id<HCMatcher>)createMatcher
{
    return containedInRect(NSMakeRect(0, 0, 10, 10));
}

- (void)testMatchesARectangleThatIsContainedInTheRectangle
{
    assertMatches(@"should match rectangle that is contained in the rectangle", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(2, 2, 5, 5)]));
}

- (void)testDoesNotMatchARectangleThatIsOutsideOfTheRectangle
{
    assertDoesNotMatch(@"should not match a rectangle that is outside of the rectangle", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(5, 5, 10, 10)]));
}

- (void)testMatchesAPointThatIsContainedInTheRectangle
{
    assertMatches(@"should match a point that is contained in the rectangle", [self createMatcher], ([NSValue valueWithPoint:NSMakePoint(2, 2)]));
}

- (void)testMatchesAPointThatIsOutsideOfTheRectangle
{
    assertDoesNotMatch(@"should not match a point that is outside of the rectangle", [self createMatcher], ([NSValue valueWithPoint:NSMakePoint(12, 12)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"contained in <NSRect: {{0, 0}, {10, 10}}>", [self createMatcher]);
}

#endif

@end
