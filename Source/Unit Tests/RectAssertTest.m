/*
 OCHamcrest - RectAssertTest.m
 
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
