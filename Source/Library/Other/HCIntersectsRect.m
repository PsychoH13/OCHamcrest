//
//  HCIntersectsRect.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCIntersectsRect.h"

#import "HCDescription.h"
#import "HCMatcherAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

id<HCMatcher> HC_intersectsCGRect(CGRect equalArg)
{
    return [HCIntersectsCGRect intersectsCGRect:equalArg];
}


@implementation HCIntersectsCGRect

+ (HCIntersectsCGRect *)intersectsCGRect:(CGRect)aRect;
{
    return [self CGRectMatcherWithCGRect:aRect];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(CGRectValue)])
        return NO;
    
    return CGRectIntersectsRect([item CGRectValue], [self CGRectValue]);
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"interescting with rect "]
     appendValue:self];
}

@end

#else
#import <AppKit/AppKit.h>

id<HCMatcher> HC_intersectsRect(NSRect equalArg)
{
    return [HCIntersectsRect intersectsRect:equalArg];
}

@implementation HCIntersectsRect

+ (HCIntersectsRect *)intersectsRect:(NSRect)aRect;
{
    return [self rectMatcherWithRect:aRect];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(rectValue)])
        return NO;
    
    return NSIntersectsRect([item rectValue], [self rectValue]);
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"interescting with "] appendValue:self];
}

@end

#endif
