/*
 OCHamcrest - HCIsEqualToRect.m
 
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

#import "HCIsEqualToRect.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

id<HCMatcher> HC_equalToCGRect(CGRect equalArg)
{
    return [HCIsEqualToCGRect isEqualToCGRect:equalArg];
}


@implementation HCIsEqualToCGRect

+ (HCIsEqualToCGRect *)isEqualToCGRect:(CGRect)aRect;
{
    return [self CGRectMatcherWithCGRect:aRect];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(CGRectValue)])
        return NO;
    
    return CGRectEqualToRect([item CGRectValue], [self CGRectValue]);
}

@end

#else
#import <AppKit/AppKit.h>

id<HCMatcher> HC_equalToRect(NSRect equalArg)
{
    return [HCIsEqualToRect isEqualToRect:equalArg];
}

@implementation HCIsEqualToRect

+ (HCIsEqualToRect *)isEqualToRect:(NSRect)aRect;
{
    return [self rectMatcherWithRect:aRect];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(rectValue)])
        return NO;
    
    return NSEqualRects([item rectValue], [self rectValue]);
}

@end

#endif
