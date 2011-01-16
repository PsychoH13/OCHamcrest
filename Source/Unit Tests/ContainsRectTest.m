//
//  ContainsRectTest.m
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
#import "HCContainsRect.h"

@interface ContainsRectTest : AbstractMatcherTest
@end

@implementation ContainsRectTest

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

- (id<HCMatcher>)createMatcher
{
    return containsCGRect(CGRectMake(5, 5, 5, 5));
}

- (void)testMatchesARectangleThatContainsAnother
{
    assertMatches(@"should match rectangle that contains", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(0, 0, 10, 10)]));
}

- (void)testDoesNotMatchARectangleThatIsInside
{
    assertDoesNotMatch(@"should not match a rectangle that is inside of the rectangle", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(7, 7, 2, 2)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"contains <CGRect: {{5, 5}, {5, 5}}>", [self createMatcher]);
}

#else

- (id<HCMatcher>)createMatcher
{
    return containsRect(NSMakeRect(5, 5, 5, 5));
}

- (void)testMatchesARectangleThatContainsAnother
{
    assertMatches(@"should match rectangle that contains", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(0, 0, 10, 10)]));
}

- (void)testDoesNotMatchARectangleThatIsInside
{
    assertDoesNotMatch(@"should not match a rectangle that is inside of the rectangle", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(7, 7, 2, 2)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"contains <NSRect: {{5, 5}, {5, 5}}>", [self createMatcher]);
}

#endif

@end
