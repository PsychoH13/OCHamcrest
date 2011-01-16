/*
 OCHamcrest - HCRectAssert.m
 
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

#import "HCRectAssert.h"
#import "HCDescription.h"
#import "HCMatcherAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)

void HC_assertThatCGRectWithLocation(id testCase, CGRect actual, id<HCMatcher> matcher, const char* fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithCGRect:actual], matcher, fileName, lineNumber);
}

@implementation HCCGRectMatcher

+ (id)CGRectMatcherWithCGRect:(CGRect)aRect;
{
    return [self valueMatcherWithValue:[NSValue valueWithCGRect:aRect]];
}

- (CGRect)CGRectValue
{
    return [[self valueObject] CGRectValue];
}

@end

#else

void HC_assertThatRectWithLocation(id testCase, NSRect actual, id<HCMatcher> matcher, const char* fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithRect:actual], matcher, fileName, lineNumber);
}

@implementation HCRectMatcher

+ (id)rectMatcherWithRect:(NSRect)aRect;
{
    return [self valueMatcherWithValue:[NSValue valueWithRect:aRect]];
}

- (NSRect)rectValue
{
    return [[self valueObject] rectValue];
}

@end

#endif
