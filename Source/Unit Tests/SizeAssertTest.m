//
//  SizeAssertTest.m
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
#import "HCSizeAssert.h"
#import "HCIsEqual.h"

@interface SizeAssertTest : SenTestCase
@end

@implementation SizeAssertTest

- (void)setUp
{
    [self raiseAfterFailure];
}

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
- (void)testSuccessWithCGSize
{
    assertThatCGSize(CGSizeMake(10, 10), equalTo([NSValue valueWithCGSize:CGSizeMake(10, 10)]));
}

- (void)testFailureWithCGSize
{
    @try
    {
        assertThatCGSize(CGSizeMake(10, 10), equalTo([NSValue valueWithSize:CGSizeMake(0, 10)]));
    }
    @catch(NSException *exception)
    {
        NSLog(@"exception: %@", [exception reason]);
        STAssertEqualObjects(@"Expected <CGSize: {0, 10}>, got <CGSize: {10, 10}>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}
#else
- (void)testSuccessWithSize
{
    assertThatSize(NSMakeSize(10, 10), equalTo([NSValue valueWithSize:NSMakeSize(10, 10)]));
}

- (void)testFailureWithSize
{
    @try
    {
        assertThatSize(NSMakeSize(10, 10), equalTo([NSValue valueWithSize:NSMakeSize(0, 10)]));
    }
    @catch(NSException *exception)
    {
        NSLog(@"exception: %@", [exception reason]);
        STAssertEqualObjects(@"Expected <NSSize: {0, 10}>, got <NSSize: {10, 10}>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}
#endif

@end
