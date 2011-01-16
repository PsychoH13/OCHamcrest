/*
 OCHamcrest - IsEqualToRangeTest.m
 
 Created by Remy "Psy" Demarest on 15/01/2011.
 
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

// Inherited
#import "AbstractMatcherTest.h"

// OCHamcrest
#define HC_SHORTHAND
#import "HCIsEqualToRange.h"
#import "HCMatcherAssert.h"

@interface IsEqualToRangeTest : AbstractMatcherTest
@end

@implementation IsEqualToRangeTest

- (id<HCMatcher>)createMatcher
{
    return equalToRange(NSMakeRange(0, 0));
}

- (void)testComparesWithNSValue
{
    assertMatches(@"Small range", equalToRange(NSMakeRange(0, 0)), [NSValue valueWithRange:NSMakeRange(0, 0)]);
    assertMatches(@"Large range", equalToRange(NSMakeRange(0, NSUIntegerMax)), [NSValue valueWithRange:NSMakeRange(0, NSUIntegerMax)]);
    assertMatches(@"Far small range", equalToRange(NSMakeRange(NSUIntegerMax, 0)), [NSValue valueWithRange:NSMakeRange(NSUIntegerMax, 0)]);
    assertMatches(@"Far large range", equalToRange(NSMakeRange(NSUIntegerMax, NSUIntegerMax)), [NSValue valueWithRange:NSMakeRange(NSUIntegerMax, NSUIntegerMax)]);
}

- (void)testMismatchesDifferentValue
{
    assertDoesNotMatch(@"Different", equalToRange(NSMakeRange(0, 0)), [NSValue valueWithRange:NSMakeRange(10, 10)]);
}

@end
