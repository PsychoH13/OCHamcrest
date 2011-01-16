//
//  PointAssertTest.m
//  OCHamcrest
//
//  Created by Remy Demarest on 16/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>
#else
#import <AppKit/AppKit.h>
#endif

#define HC_SHORTHAND
#import "HCPointAssert.h"
#import "HCIsEqual.h"

@interface PointAssertTest : SenTestCase
@end

@implementation PointAssertTest

- (void)setUp
{
    [self raiseAfterFailure];
}

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
- (void)testSuccessWithCGPoint
{
    assertThatCGPoint(CGPointMake(10, 10), equalTo([NSValue valueWithCGPoint:CGPointMake(10, 10)]));
}

- (void)testFailureWithCGPoint
{
    @try
    {
        assertThatCGPoint(CGPointMake(10, 10), equalTo([NSValue valueWithPoint:CGPointMake(0, 10)]));
    }
    @catch(NSException *exception)
    {
        NSLog(@"exception: %@", [exception reason]);
        STAssertEqualObjects(@"Expected <CGPoint: {0, 10}>, got <CGPoint: {10, 10}>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}
#else
- (void)testSuccessWithPoint
{
    assertThatPoint(NSMakePoint(10, 10), equalTo([NSValue valueWithPoint:NSMakePoint(10, 10)]));
}

- (void)testFailureWithPoint
{
    @try
    {
        assertThatPoint(NSMakePoint(10, 10), equalTo([NSValue valueWithPoint:NSMakePoint(0, 10)]));
    }
    @catch(NSException *exception)
    {
        NSLog(@"exception: %@", [exception reason]);
        STAssertEqualObjects(@"Expected <NSPoint: {0, 10}>, got <NSPoint: {10, 10}>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}
#endif

@end
