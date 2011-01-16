/*
 OCHamcrest - PointAssertTest.m
 
 Created by Remy "Psy" Demarest on 16/01/2011.
 
 Copyright (c) 2011 Remy "Psy" Demarest
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

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
