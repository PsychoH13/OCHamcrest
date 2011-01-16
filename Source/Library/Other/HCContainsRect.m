//
//  HCContainsRect.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCContainsRect.h"

#import "HCDescription.h"
#import "HCMatcherAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

id<HCMatcher> HC_containsCGRect(CGRect equalArg)
{
    return [HCContainsCGRect containsCGRect:equalArg];
}


@implementation HCContainsCGRect

+ (HCContainsCGRect *)containsCGRect:(CGRect)aRect;
{
    return [self CGRectMatcherWithCGRect:aRect];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(CGRectValue)])
        return NO;
    
    return CGRectContainsRect([item CGRectValue], [self CGRectValue]);
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"containing rect "]
     appendValue:self];
}

@end

#else
#import <AppKit/AppKit.h>

id<HCMatcher> HC_containsRect(NSRect equalArg)
{
    return [HCContainsRect containsRect:equalArg];
}

@implementation HCContainsRect

+ (HCContainsRect *)containsRect:(NSRect)aRect;
{
    return [self rectMatcherWithRect:aRect];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(rectValue)])
        return NO;
    
    return NSContainsRect([item rectValue], [self rectValue]);
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"contains rect "]
     appendValue:self];
}

@end

#endif
