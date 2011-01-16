//
//  IsNullPointerTest.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

// Inherited
#import "AbstractMatcherTest.h"

// OCHamcrest
#define HC_SHORTHAND
#import "HCIsNullPointer.h"
#import "HCIsNot.h"
#import "HCMatcherAssert.h"


@interface IsNullPointerTest : AbstractMatcherTest
@end

@implementation IsNullPointerTest

- (id<HCMatcher>)createMatcher
{
    return nullValue();
}

- (void)testEvaluatesToTrueIfArgumentIsNull
{
    id arg;
    
    assertThatPointer(NULL, nullValue());
    assertThatPointer(&arg, isNot(nullValue()));
    
    assertThatPointer(&arg, notNullValue());
    assertThatPointer(NULL, isNot(notNullValue()));
}


- (void) testHasAReadableDescription
{
    assertDescription(@"NULL", nullValue());
    assertDescription(@"not NULL", notNullValue());
}

@end
