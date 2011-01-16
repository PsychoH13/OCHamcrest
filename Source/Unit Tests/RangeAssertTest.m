//
//  RangeAssertTest.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#import "HCRangeAssert.h"
#import "HCIsEqual.h"

@interface RangeAssertTest : SenTestCase
@end

@implementation RangeAssertTest

- (void)setUp
{
    [self raiseAfterFailure];
}

- (void)testSuccessWithRange
{
    assertThatRange(NSMakeRange(10, 10), equalTo([NSValue valueWithRange:NSMakeRange(10, 10)]));
}

- (void)testFailureWithRange
{
    @try
    {
        assertThatRange(NSMakeRange(10, 10), equalTo([NSValue valueWithRange:NSMakeRange(0, 10)]));
    }
    @catch(NSException *exception)
    {
        NSLog(@"exception: %@", [exception reason]);
        STAssertEqualObjects(@"Expected <NSRange: {0, 10}>, got <NSRange: {10, 10}>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}

@end
