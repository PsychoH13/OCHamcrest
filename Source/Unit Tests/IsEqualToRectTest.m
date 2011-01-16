//
//  IsEqualToRectTest.m
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
#import "HCIsEqualToRect.h"
#import "HCMatcherAssert.h"

@interface IsEqualToRectTest : AbstractMatcherTest
@end

@implementation IsEqualToRectTest

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

- (id<HCMatcher>)createMatcher
{
    return equalToCGRect(CGRectMake(0, 0));
}

- (void)testComparesWithNSValue
{
    assertMatches(@"Rect with small extents", equalToCGRect(CGRectMake(0, 0, 0, 0)), [NSValue valueWithCGRect:CGRectMake(0, 0, 0, 0)]);
    assertMatches(@"Rect with large extents", equalToCGRect(CGRectMake(CGFLOAT_MAX, CGFLOAT_MAX)), [NSValue valueWithCGRect:CGRectMake(CGFLOAT_MAX, CGFLOAT_MAX)]);
}

- (void)testMismatchesDifferentValue
{
    assertDoesNotMatch(@"Different", equalToCGRect(CGRectMake(0, 0, 0, 0)), [NSValue valueWithCGRect:CGRectMake(0, 0, 10, 10)]);
}

#else

- (id<HCMatcher>)createMatcher
{
    return equalToRect(NSMakeRect(0, 0, 0, 0));
}

- (void)testComparesWithNSValue
{
    assertMatches(@"Rect with small extents", equalToRect(NSMakeRect(0, 0, 0, 0)), [NSValue valueWithRect:NSMakeRect(0, 0, 0, 0)]);
    assertMatches(@"Rect with large extents", equalToRect(NSMakeRect(CGFLOAT_MAX, CGFLOAT_MAX, CGFLOAT_MAX, CGFLOAT_MAX)), [NSValue valueWithRect:NSMakeRect(CGFLOAT_MAX, CGFLOAT_MAX, CGFLOAT_MAX, CGFLOAT_MAX)]);
}

- (void)testMismatchesDifferentValue
{
    assertDoesNotMatch(@"Different", equalToRect(NSMakeRect(0, 0, 0, 0)), [NSValue valueWithRect:NSMakeRect(0, 0, 10, 10)]);
}

#endif

@end
