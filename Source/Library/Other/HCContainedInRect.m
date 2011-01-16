//
//  HCContainedInRect.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

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
    if([item respondsToSelector:@selector(CGRectValue)])
        return CGRectContainsRect([self CGRectValue], [item CGRectValue]);
    
    if([item respondsToSelector:@selector(CGPointValue)])
        return CGRectContainsPoint([self CGRectValue], [item CGPointValue]);
    
    return NO;
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"contained in rect "]
     appendValue:self];
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
    if([item respondsToSelector:@selector(rectValue)])
        return NSContainsRect([self rectValue], [item rectValue]);
    
    if([item respondsToSelector:@selector(pointValue)])
        return NSPointInRect([item pointValue], [self rectValue]);
    
    return NO;
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"contained in rect "]
     appendValue:self];
}

@end

#endif
