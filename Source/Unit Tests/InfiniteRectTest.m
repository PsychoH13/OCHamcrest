/*
 OCHamcrest - InfiniteRectTest.m
 
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
#import "HCInfiniteRect.h"

@interface InfiniteRectTest : AbstractMatcherTest
@end

@implementation InfiniteRectTest

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

- (id<HCMatcher>)createMatcher
{
    return infiniteCGRect();
}

- (void)testMatchesAnInfiniteRectangle
{
    assertMatches(@"should match an infinite rectangle", [self createMatcher], ([NSValue valueWithCGRect:CGRectInfinite);
}

- (void)testDoesNotMatchAnNonInfiniteRectangle
{
    assertDoesNotMatch(@"should not match a rectangle that is not infinite", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(7, 7, 2, 2)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"infinite rect", [self createMatcher]);
}

#else

- (id<HCMatcher>)createMatcher
{
    return infiniteRect();
}

- (void)testMatchesAnInfiniteRectangle
{
    assertMatches(@"should match an infinite rectangle", [self createMatcher], ([NSValue valueWithRect:NSRectFromCGRect(CGRectInfinite)]));
}

- (void)testDoesNotMatchAnNonInfiniteRectangle
{
    assertDoesNotMatch(@"should not match a rectangle that is not infinite", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(7, 7, 2, 2)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"infinite rect", [self createMatcher]);
}

#endif

@end
