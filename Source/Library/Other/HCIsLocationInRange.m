/*
 OCHamcrest - HCIsLocationInRange.m
 
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

#import "HCIsLocationInRange.h"

#import "HCDescription.h"

@implementation HCIsLocationInRange

+ (HCIsLocationInRange *)isLocationInRange:(NSRange)aRange;
{
    return [self rangeMatcherWithRange:aRange];
}

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:[NSString stringWithFormat:@"located in range %@", self]];
}

- (BOOL)matches:(id)item
{
#if defined(NSINTEGER_DEFINED) && NSINTEGER_DEFINED
    NSUInteger value = 0;
#else
    unsigned   value = 0;
#endif
    
#if defined(NSINTEGER_DEFINED) && NSINTEGER_DEFINED
    if([item respondsToSelector:@selector(unsignedIntegerValue)])
        value = [item unsignedIntegerValue];
    else if([item respondsToSelector:@selector(integerValue)])
        value = [item integerValue];
#else
    if(NO) /* do nothing */;
#endif
    else if([item respondsToSelector:@selector(unsignedIntValue)])
        value = [item unsignedIntValue];
    else if([item respondsToSelector:@selector(intValue)])
        value = [item intValue];
    else
        return NO;
    
    return NSLocationInRange(value, [self rangeValue]);
}

@end

id<HCMatcher> HC_locationInRange(NSRange aRange)
{
    return [HCIsLocationInRange isLocationInRange:aRange];
}
