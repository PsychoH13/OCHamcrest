//
//  HCRectIsNull.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCNullRect.h"

#import "HCDescription.h"
#import "HCMatcherAssert.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

id<HCMatcher> HC_nullCGRect(void)
{
    return [HCNullCGRect nullCGRect];
}


@implementation HCNullCGRect

+ (HCNullCGRect *)nullCGRect;
{
    return [self CGRectMatcherWithCGRect:CGRectMake(0.0, 0.0, 0.0, 0.0)];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(CGRectValue)])
        return NO;
    
    return CGRectIsNull([item CGRectValue]);
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendText:@"null rect "]
     appendValue:self];
}

@end

#else
#import <AppKit/AppKit.h>

id<HCMatcher> HC_nullRect(void)
{
    return [HCNullRect nullRect];
}

@implementation HCNullRect

+ (HCNullRect *)nullRect;
{
    return [self rectMatcherWithRect:NSMakeRect(0.0, 0.0, 0.0, 0.0)];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(rectValue)])
        return NO;
    
    return CGRectIsNull(NSRectToCGRect([item rectValue]));
}

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:@"null rect"];
}

@end

#endif
