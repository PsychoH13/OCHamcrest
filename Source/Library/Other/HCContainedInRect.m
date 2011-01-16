/*
 OCHamcrest - HCContainedInRect.m
 
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

#import "HCContainedInRect.h"

#import "HCDescription.h"
#import "HCMatcherAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

id<HCMatcher> HC_containedInCGRect(CGRect equalArg)
{
    return [HCContainedInCGRect containedInCGRect:equalArg];
}


@implementation HCContainedInCGRect

+ (HCContainedInCGRect *)containedInCGRect:(CGRect)aRect;
{
    return [self CGRectMatcherWithCGRect:aRect];
}

- (BOOL)matches:(id)item
{
    if([item respondsToSelector:@selector(objCType)])
    {
        const char *type = [item objCType];
        
        if(strcmp(type, @encode(CGRect)) == 0 && [item respondsToSelector:@selector(CGRectValue)])
            return CGRectContainsRect([self CGRectValue], [item CGRectValue]);
        else if(strcmp(type, @encode(CGPoint)) == 0 && [item respondsToSelector:@selector(CGPointValue)])
            return CGRectContainsPoint([self CGRectValue], [item CGPointValue]);
    }
    
    if([item respondsToSelector:@selector(CGRectValue)])
        return CGRectContainsRect([self CGRectValue], [item CGRectValue]);
    
    if([item respondsToSelector:@selector(CGPointValue)])
        return CGRectContainsPoint([self CGRectValue], [item CGPointValue]);
    
    return NO;
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"contained in "] appendValue:self];
}

@end

#else
#import <AppKit/AppKit.h>

id<HCMatcher> HC_containedInRect(NSRect equalArg)
{
    return [HCContainedInRect containedInRect:equalArg];
}

@implementation HCContainedInRect

+ (HCContainedInRect *)containedInRect:(NSRect)aRect;
{
    return [self rectMatcherWithRect:aRect];
}

- (BOOL)matches:(id)item
{
    if([item respondsToSelector:@selector(objCType)])
    {
        const char *type = [item objCType];
        
        if(strcmp(type, @encode(NSRect)) == 0 && [item respondsToSelector:@selector(rectValue)])
            return NSContainsRect([self rectValue], [item rectValue]);
        else if(strcmp(type, @encode(NSPoint)) == 0 && [item respondsToSelector:@selector(pointValue)])
            return NSPointInRect([item pointValue], [self rectValue]);
    }
    
    if([item respondsToSelector:@selector(rectValue)])
        return NSContainsRect([self rectValue], [item rectValue]);
    
    if([item respondsToSelector:@selector(pointValue)])
        return NSPointInRect([item pointValue], [self rectValue]);
    
    return NO;
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"contained in "] appendValue:self];
}

@end

#endif
