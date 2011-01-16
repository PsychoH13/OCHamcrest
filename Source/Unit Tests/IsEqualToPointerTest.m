//
//  IsEqualToPointerTest.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

// Inherited
#import "AbstractMatcherTest.h"

// OCHamcrest
#define HC_SHORTHAND
#import "HCIsEqualToPointer.h"
#import "HCMatcherAssert.h"

@interface IsEqualToPointerTest : AbstractMatcherTest
@end

@implementation IsEqualToPointerTest

- (id<HCMatcher>)createMatcher
{
    return equalToPointer(NULL);
}

- (void)testComparesWithNSValue
{
    int i = 0;
    assertMatches(@"not NULL pointer", equalToPointer(&i), [NSValue valueWithPointer:&i]);
    assertMatches(@"NULL pointer", equalToPointer(NULL), [NSValue valueWithPointer:NULL]);
}

- (void)testMismatchesDifferentNumber
{
    int i = 0;
    assertDoesNotMatch(@"Different", equalToPointer(NULL), [NSValue valueWithPointer:&i]);
}

@end
