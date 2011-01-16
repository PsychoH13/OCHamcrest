//
//  HCIsEqualToSize.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

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
