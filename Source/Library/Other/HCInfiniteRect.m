//
//  HCRectIsInfinite.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCInfiniteRect.h"

#import "HCDescription.h"
#import "HCMatcherAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

id<HCMatcher> HC_infiniteCGRect(void)
{
    return [HCInfiniteCGRect infiniteCGRect];
}


@implementation HCInfiniteCGRect

+ (HCInfiniteCGRect *)infiniteCGRect;
{
    return [self CGRectMatcherWithCGRect:CGRectMake(0.0, 0.0, 0.0, 0.0)];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(CGRectValue)])
        return NO;
    
    return CGRectIsInfinite([item CGRectValue]);
}

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:@"infinite rect"];
}

@end

#else
#import <AppKit/AppKit.h>

id<HCMatcher> HC_infiniteRect(void)
{
    return [HCInfiniteRect infiniteRect];
}

@implementation HCInfiniteRect

+ (HCInfiniteRect *)infiniteRect;
{
    return [self rectMatcherWithRect:NSMakeRect(0.0, 0.0, 0.0, 0.0)];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(rectValue)])
        return NO;
    
    return CGRectIsInfinite(NSRectToCGRect([item rectValue]));
}

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:@"infinite rect"];
}

@end

#endif
