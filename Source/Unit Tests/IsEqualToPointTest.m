/*
 OCHamcrest - IsEqualToPointTest.m
 
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
#import "HCIsEqualToPoint.h"
#import "HCMatcherAssert.h"

@interface IsEqualToPointTest : AbstractMatcherTest
@end

@implementation IsEqualToPointTest

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

- (id<HCMatcher>)createMatcher
{
    return equalToCGPoint(CGPointMake(0, 0));
}

- (void)testComparesWithNSValue
{
    assertMatches(@"Point with low coordinates", equalToCGPoint(CGPointMake(0, 0)), [NSValue valueWithCGPoint:CGPointMake(0, 0)]);
    assertMatches(@"Point with high coordinates", equalToCGPoint(CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX)), [NSValue valueWithCGPoint:CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX)]);
}

- (void)testMismatchesDifferentValue
{
    assertDoesNotMatch(@"Different", equalToCGPoint(CGPointMake(0, 0)), [NSValue valueWithCGPoint:CGPointMake(10, 10)]);
}

#else

- (id<HCMatcher>)createMatcher
{
    return equalToPoint(NSMakePoint(0, 0));
}

- (void)testComparesWithNSValue
{
    assertMatches(@"Point with low coordinates", equalToPoint(NSMakePoint(0, 0)), [NSValue valueWithPoint:NSMakePoint(0, 0)]);
    assertMatches(@"Point with high coordinates", equalToPoint(NSMakePoint(CGFLOAT_MAX, CGFLOAT_MAX)), [NSValue valueWithPoint:NSMakePoint(CGFLOAT_MAX, CGFLOAT_MAX)]);
}

- (void)testMismatchesDifferentValue
{
    assertDoesNotMatch(@"Different", equalToPoint(NSMakePoint(0, 0)), [NSValue valueWithPoint:NSMakePoint(10, 10)]);
}

#endif

@end
