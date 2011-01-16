/*
 OCHamcrest - ContainsRectTest.m
 
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

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>
#else
#import <AppKit/AppKit.h>
#endif

// Inherited
#import "AbstractMatcherTest.h"

// OCHamcrest
#define HC_SHORTHAND
#import "HCContainsRect.h"

@interface ContainsRectTest : AbstractMatcherTest
@end

@implementation ContainsRectTest

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

- (id<HCMatcher>)createMatcher
{
    return containsCGRect(CGRectMake(5, 5, 5, 5));
}

- (void)testMatchesARectangleThatContainsAnother
{
    assertMatches(@"should match rectangle that contains", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(0, 0, 10, 10)]));
}

- (void)testDoesNotMatchARectangleThatIsInside
{
    assertDoesNotMatch(@"should not match a rectangle that is inside of the rectangle", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(7, 7, 2, 2)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"contains <CGRect: {{5, 5}, {5, 5}}>", [self createMatcher]);
}

#else

- (id<HCMatcher>)createMatcher
{
    return containsRect(NSMakeRect(5, 5, 5, 5));
}

- (void)testMatchesARectangleThatContainsAnother
{
    assertMatches(@"should match rectangle that contains", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(0, 0, 10, 10)]));
}

- (void)testDoesNotMatchARectangleThatIsInside
{
    assertDoesNotMatch(@"should not match a rectangle that is inside of the rectangle", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(7, 7, 2, 2)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"contains <NSRect: {{5, 5}, {5, 5}}>", [self createMatcher]);
}

#endif

@end
