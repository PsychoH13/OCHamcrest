//
//  IsEqualToRangeTest.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//


// Inherited
#import "AbstractMatcherTest.h"

// OCHamcrest
#define HC_SHORTHAND
#import "HCIsEqualToRange.h"
#import "HCMatcherAssert.h"

@interface IsEqualToRangeTest : AbstractMatcherTest
@end

@implementation IsEqualToRangeTest

- (id<HCMatcher>)createMatcher
{
    return equalToRange(NSMakeRange(0, 0));
}

- (void)testComparesWithNSValue
{
    assertMatches(@"Small range", equalToRange(NSMakeRange(0, 0)), [NSValue valueWithRange:NSMakeRange(0, 0)]);
    assertMatches(@"Large range", equalToRange(NSMakeRange(0, NSUIntegerMax)), [NSValue valueWithRange:NSMakeRange(0, NSUIntegerMax)]);
    assertMatches(@"Far small range", equalToRange(NSMakeRange(NSUIntegerMax, 0)), [NSValue valueWithRange:NSMakeRange(NSUIntegerMax, 0)]);
    assertMatches(@"Far large range", equalToRange(NSMakeRange(NSUIntegerMax, NSUIntegerMax)), [NSValue valueWithRange:NSMakeRange(NSUIntegerMax, NSUIntegerMax)]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Different", equalToRange(NSMakeRange(0, 0)), [NSValue valueWithRange:NSMakeRange(10, 10)]);
}

@end
