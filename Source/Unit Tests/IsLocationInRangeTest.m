//
//  IsLocationInRangeTest.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

// Inherited
#import "AbstractMatcherTest.h"

// OCHamcrest
#define HC_SHORTHAND
#import "HCIsLocationInRange.h"
#import "HCMatcherAssert.h"

@interface IsLocationInRangeTest : AbstractMatcherTest
@end

@implementation IsLocationInRangeTest

- (id<HCMatcher>)createMatcher
{
    return locationInRange(NSMakeRange(0, 0));
}

- (void)testComparesWithNSNumber
{
    assertMatches(@"In range", locationInRange(NSMakeRange(0, 10)), [NSNumber numberWithInt:5]);
}

- (void)testMismatchesDifferentNumber
{
    assertDoesNotMatch(@"Out of range", locationInRange(NSMakeRange(0, 1)), [NSNumber numberWithInt:5]);
}

@end
