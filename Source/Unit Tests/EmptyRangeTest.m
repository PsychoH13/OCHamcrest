//
//  EmptyRangeTest.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

// Inherited
#import "AbstractMatcherTest.h"

// OCHamcrest
#define HC_SHORTHAND
#import "HCEmptyRange.h"
#import "HCIsNot.h"
#import "HCMatcherAssert.h"

@interface EmptyRangeTest : AbstractMatcherTest
@end

@implementation EmptyRangeTest

- (id<HCMatcher>)createMatcher
{
    return emptyRange();
}

- (void)testEvaluatesToTrueIfRangeIsEmpty
{
    assertMatches(@"Empty range", emptyRange(), [NSValue valueWithRange:NSMakeRange(NSNotFound, 0)]);
    assertMatches(@"Not empty range", isNot(emptyRange()), [NSValue valueWithRange:NSMakeRange(0, 10)]);
}


- (void) testHasAReadableDescription
{
    assertDescription(@"empty range", emptyRange());
}

@end
