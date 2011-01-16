//
//  HCIsEqualToRect.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

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
