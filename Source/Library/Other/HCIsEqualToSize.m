/*
 OCHamcrest - HCIsEqualToSize.m
 
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

#import "HCIsEqualToSize.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

id<HCMatcher> HC_equalToCGSize(CGSize equalArg)
{
    return [HCIsEqualToCGSize isEqualToCGSize:equalArg];
}


@implementation HCIsEqualToCGSize

+ (HCIsEqualToCGSize *)isEqualToCGSize:(CGSize)aSize;
{
    return [self CGSizeMatcherWithCGSize:aSize];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(CGSizeValue)])
        return NO;
    
    return CGSizeEqualToSize([item CGSizeValue], [self CGSizeValue]);
}

@end

#else
#import <AppKit/AppKit.h>

id<HCMatcher> HC_equalToSize(NSSize equalArg)
{
    return [HCIsEqualToSize isEqualToSize:equalArg];
}

@implementation HCIsEqualToSize

+ (HCIsEqualToSize *)isEqualToSize:(NSSize)aSize;
{
    return [self sizeMatcherWithSize:aSize];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(sizeValue)])
        return NO;
    
    return NSEqualSizes([item sizeValue], [self sizeValue]);
}

@end

#endif
