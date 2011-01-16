//
//  IsEqualToPointTest.m
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
#import "HCIsEqualToPoint.h"
#import "HCMatcherAssert.h"

@interface IsEqualToPointTest : AbstractMatcherTest
@end

@implementation IsEqualToPointTest

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

- (id<HCMatcher>)createMatcher
{
    return equalToCGPoint(CGPointMake(0, 0));
}

- (void)testComparesWithNSValue
{
    assertMatches(@"Point with low coordinates", equalToCGPoint(CGPointMake(0, 0)), [NSValue valueWithCGPoint:CGPointMake(0, 0)]);
    assertMatches(@"Point with high coordinates", equalToCGPoint(CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX)), [NSValue valueWithCGPoint:CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX)]);
}

- (void)testMismatchesDifferentValue
{
    assertDoesNotMatch(@"Different", equalToCGPoint(CGPointMake(0, 0)), [NSValue valueWithCGPoint:CGPointMake(10, 10)]);
}

#else

- (id<HCMatcher>)createMatcher
{
    return equalToPoint(NSMakePoint(0, 0));
}

- (void)testComparesWithNSValue
{
    assertMatches(@"Point with low coordinates", equalToPoint(NSMakePoint(0, 0)), [NSValue valueWithPoint:NSMakePoint(0, 0)]);
    assertMatches(@"Point with high coordinates", equalToPoint(NSMakePoint(CGFLOAT_MAX, CGFLOAT_MAX)), [NSValue valueWithPoint:NSMakePoint(CGFLOAT_MAX, CGFLOAT_MAX)]);
}

- (void)testMismatchesDifferentValue
{
    assertDoesNotMatch(@"Different", equalToPoint(NSMakePoint(0, 0)), [NSValue valueWithPoint:NSMakePoint(10, 10)]);
}

#endif

@end
