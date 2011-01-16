//
//  HCIsEqualToPoint.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCIsEqualToPoint.h"

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>

id<HCMatcher> HC_equalToCGPoint(CGPoint equalArg)
{
    return [HCIsEqualToCGPoint isEqualToCGPoint:equalArg];
}


@implementation HCIsEqualToCGPoint

+ (HCIsEqualToCGPoint *)isEqualToCGPoint:(CGPoint)aPoint;
{
    return [self CGPointMatcherWithCGPoint:aPoint];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(CGPointValue)])
        return NO;
    
    return CGPointEqualToPoint([item CGPointValue], [self CGPointValue]);
}

@end

#else
#import <AppKit/AppKit.h>

id<HCMatcher> HC_equalToPoint(NSPoint equalArg)
{
    return [HCIsEqualToPoint isEqualToPoint:equalArg];
}

@implementation HCIsEqualToPoint

+ (HCIsEqualToPoint *)isEqualToPoint:(NSPoint)aPoint;
{
    return [self pointMatcherWithPoint:aPoint];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(pointValue)])
        return NO;
    
    return NSEqualPoints([item pointValue], [self pointValue]);
}

@end

#endif
