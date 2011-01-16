//
//  HCRectIsEmpty.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCEmptyRect.h"

#import "HCDescription.h"
#import "HCMatcherAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

id<HCMatcher> HC_emptyCGRect(void)
{
    return [HCEmptyCGRect emptyCGRect];
}


@implementation HCEmptyCGRect

+ (HCEmptyCGRect *)emptyCGRect;
{
    return [self CGRectMatcherWithCGRect:CGRectMake(0.0, 0.0, 0.0, 0.0)];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(CGRectValue)])
        return NO;
    
    return CGRectIsEmpty([item CGRectValue]);
}

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:@"empty rect"];
}

@end

#else
#import <AppKit/AppKit.h>

id<HCMatcher> HC_emptyRect(void)
{
    return [HCEmptyRect emptyRect];
}

@implementation HCEmptyRect

+ (HCEmptyRect *)emptyRect;
{
    return [self rectMatcherWithRect:NSMakeRect(0.0, 0.0, 0.0, 0.0)];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(rectValue)])
        return NO;
    
    return NSIsEmptyRect([item rectValue]);
}

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:@"empty rect"];
}

@end

#endif
