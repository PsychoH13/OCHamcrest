/*
 OCHamcrest - HCRectAssert.h
 
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

#import <Foundation/Foundation.h>

#import "HCDefines.h"
#import "HCValueMatcher.h"

@protocol HCMatcher;

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

OCHAMCREST_EXPORT void HC_assertThatCGRectWithLocation(id testCase, CGRect actual, id<HCMatcher> matcher, const char* fileName, int lineNumber);

#define HC_assertThatCGRect(actual, matcher)  \
    HC_assertThatCGRectWithLocation(self, actual, matcher, __FILE__, __LINE__)

#ifdef HC_SHORTHAND
#define assertThatCGRect HC_assertThatCGRect
#endif

@interface HCCGRectMatcher : HCValueMatcher

+ (id)CGRectMatcherWithCGRect:(CGRect)aRect;

@property(nonatomic, readonly) CGRect CGRectValue;

@end

#else
#import <AppKit/AppKit.h>

OCHAMCREST_EXPORT void HC_assertThatRectWithLocation(id testCase, NSRect actual, id<HCMatcher> matcher, const char* fileName, int lineNumber);

#define HC_assertThatRect(actual, matcher)  \
    HC_assertThatRectWithLocation(self, actual, matcher, __FILE__, __LINE__)

#ifdef HC_SHORTHAND
#define assertThatRect HC_assertThatRect
#endif

@interface HCRectMatcher : HCValueMatcher

+ (id)rectMatcherWithRect:(NSRect)aRect;

@property(nonatomic, readonly) NSRect rectValue;

@end

#endif
