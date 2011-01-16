/*
 OCHamcrest - HCSizeAssert.m
 
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

#import "HCSizeAssert.h"
#import "HCDescription.h"
#import "HCMatcherAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

void HC_assertThatCGSizeWithLocation(id testCase, CGSize actual, id<HCMatcher> matcher, const char* fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithCGSize:actual], matcher, fileName, lineNumber);
}

@implementation HCCGSizeMatcher

+ (id)CGSizeMatcherWithCGSize:(CGSize)aSize;
{
    return [self valueMatcherWithValue:[NSValue valueWithCGSize:aSize]];
}

- (CGSize)CGSizeValue
{
    return [[self valueObject] CGSizeValue];
}

@end

#else

void HC_assertThatSizeWithLocation(id testCase, NSSize actual, id<HCMatcher> matcher, const char* fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithSize:actual], matcher, fileName, lineNumber);
}

@implementation HCSizeMatcher

+ (id)sizeMatcherWithSize:(NSSize)aSize;
{
    return [self valueMatcherWithValue:[NSValue valueWithSize:aSize]];
}

- (NSSize)sizeValue
{
    return [[self valueObject] sizeValue];
}

@end

#endif
