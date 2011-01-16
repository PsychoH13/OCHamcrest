//
//  InvalidRangeTest.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

// Inherited
#import "AbstractMatcherTest.h"

// OCHamcrest
#define HC_SHORTHAND
#import "HCInvalidRange.h"
#import "HCIsNot.h"
#import "HCMatcherAssert.h"

@interface InvalidRangeTest : AbstractMatcherTest
@end

@implementation InvalidRangeTest

- (id<HCMatcher>)createMatcher
{
    return invalidRange();
}

- (void)testComparesWithNSValue
{
}

- (void)testEvaluatesToTrueIfRangeIsInvalid
{
    assertMatches(@"Valid range", validRange(), [NSValue valueWithRange:NSMakeRange(0, 10)]);
    assertMatches(@"Valid range", isNot(validRange()), [NSValue valueWithRange:NSMakeRange(NSNotFound, 10)]);
    assertMatches(@"Invalid range", invalidRange(), [NSValue valueWithRange:NSMakeRange(NSNotFound, 10)]);
    assertMatches(@"Invalid range", isNot(invalidRange()), [NSValue valueWithRange:NSMakeRange(0, 10)]);
}


- (void) testHasAReadableDescription
{
    assertDescription(@"valid range", validRange());
    assertDescription(@"invalid range", invalidRange());
}

@end
