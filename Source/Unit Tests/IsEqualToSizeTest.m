//
//  IsEqualToSizeTest.m
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
#import "HCIsEqualToSize.h"
#import "HCMatcherAssert.h"

@interface IsEqualToSizeTest : AbstractMatcherTest
@end

@implementation IsEqualToSizeTest

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

- (id<HCMatcher>)createMatcher
{
    return equalToCGSize(CGSizeMake(0, 0));
}

- (void)testComparesWithNSValue
{
    assertMatches(@"Size with small extents", equalToCGSize(CGSizeMake(0, 0)), [NSValue valueWithCGSize:CGSizeMake(0, 0)]);
    assertMatches(@"Size with large extents", equalToCGSize(CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)), [NSValue valueWithCGSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)]);
}

- (void)testMismatchesDifferentValue
{
    assertDoesNotMatch(@"Different", equalToCGSize(CGSizeMake(0, 0)), [NSValue valueWithCGSize:CGSizeMake(10, 10)]);
}

#else

- (id<HCMatcher>)createMatcher
{
    return equalToSize(NSMakeSize(0, 0));
}

- (void)testComparesWithNSValue
{
    assertMatches(@"Size with small extents", equalToSize(NSMakeSize(0, 0)), [NSValue valueWithSize:NSMakeSize(0, 0)]);
    assertMatches(@"Size with large extents", equalToSize(NSMakeSize(CGFLOAT_MAX, CGFLOAT_MAX)), [NSValue valueWithSize:NSMakeSize(CGFLOAT_MAX, CGFLOAT_MAX)]);
}

- (void)testMismatchesDifferentValue
{
    assertDoesNotMatch(@"Different", equalToSize(NSMakeSize(0, 0)), [NSValue valueWithSize:NSMakeSize(10, 10)]);
}

#endif

@end
