//
//  RectAssertTest.m
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
#import "HCRectAssert.h"
#import "HCIsEqual.h"

@interface RectAssertTest : SenTestCase
@end

@implementation RectAssertTest

- (void)setUp
{
    [self raiseAfterFailure];
}

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
- (void)testSuccessWithCGRect
{
    assertThatCGRect(CGRectMake(20, 20, 10, 10), equalTo([NSValue valueWithCGRect:CGRectMake(20, 20, 10, 10)]));
}

- (void)testFailureWithCGRect
{
    @try
    {
        assertThatCGRect(CGRectMake(20, 20, 10, 10), equalTo([NSValue valueWithRect:CGRectMake(0, 0, 10, 10)]));
    }
    @catch(NSException *exception)
    {
        NSLog(@"exception: %@", [exception reason]);
        STAssertEqualObjects(@"Expected <CGRect: {{0, 0}, {10, 10}}>, got <CGRect: {{20, 20}, {10, 10}}>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}
#else
- (void)testSuccessWithRect
{
    assertThatRect(NSMakeRect(20, 20, 10, 10), equalTo([NSValue valueWithRect:NSMakeRect(20, 20, 10, 10)]));
}

- (void)testFailureWithRect
{
    @try
    {
        assertThatRect(NSMakeRect(20, 20, 10, 10), equalTo([NSValue valueWithRect:NSMakeRect(0, 0, 10, 10)]));
    }
    @catch(NSException *exception)
    {
        NSLog(@"exception: %@", [exception reason]);
        STAssertEqualObjects(@"Expected <NSRect: {{0, 0}, {10, 10}}>, got <NSRect: {{20, 20}, {10, 10}}>", [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}
#endif

@end
