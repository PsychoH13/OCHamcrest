/*
 OCHamcrest - ContainedInRectTest.m
 
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
#import "HCContainedInRect.h"

@interface ContainedInRectTest : AbstractMatcherTest
@end

@implementation ContainedInRectTest

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

- (id<HCMatcher>)createMatcher
{
    return containedInCGRect(CGRectMake(0, 0, 10, 10));
}

- (void)testMatchesARectangleThatContainedInAnother
{
    assertMatches(@"should match rectangle that containedIn", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(0, 0, 10, 10)]));
}

- (void)testDoesNotMatchARectangleThatIsInside
{
    assertDoesNotMatch(@"should not match a rectangle that is inside of the rectangle", [self createMatcher], ([NSValue valueWithCGRect:CGRectMake(7, 7, 2, 2)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"contained in <CGRect: {{0, 0}, {10, 10}}>", [self createMatcher]);
}

#else

- (id<HCMatcher>)createMatcher
{
    return containedInRect(NSMakeRect(0, 0, 10, 10));
}

- (void)testMatchesARectangleThatIsContainedInTheRectangle
{
    assertMatches(@"should match rectangle that is contained in the rectangle", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(2, 2, 5, 5)]));
}

- (void)testDoesNotMatchARectangleThatIsOutsideOfTheRectangle
{
    assertDoesNotMatch(@"should not match a rectangle that is outside of the rectangle", [self createMatcher], ([NSValue valueWithRect:NSMakeRect(5, 5, 10, 10)]));
}

- (void)testMatchesAPointThatIsContainedInTheRectangle
{
    assertMatches(@"should match a point that is contained in the rectangle", [self createMatcher], ([NSValue valueWithPoint:NSMakePoint(2, 2)]));
}

- (void)testMatchesAPointThatIsOutsideOfTheRectangle
{
    assertDoesNotMatch(@"should not match a point that is outside of the rectangle", [self createMatcher], ([NSValue valueWithPoint:NSMakePoint(12, 12)]));
}

- (void)testHasAReadableDescription
{
    assertDescription(@"contained in <NSRect: {{0, 0}, {10, 10}}>", [self createMatcher]);
}

#endif

@end
