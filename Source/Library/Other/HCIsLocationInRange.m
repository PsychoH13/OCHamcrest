//
//  HCRange.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCIsLocationInRange.h"

#import "HCDescription.h"

@implementation HCIsLocationInRange

+ (HCIsLocationInRange *)isLocationInRange:(NSRange)aRange;
{
    return [self rangeMatcherWithRange:aRange];
}

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:[NSString stringWithFormat:@"located in range %@", self]];
}

- (BOOL)matches:(id)item
{
#if defined(NSINTEGER_DEFINED) && NSINTEGER_DEFINED
    NSUInteger value = 0;
#else
    unsigned   value = 0;
#endif
    
#if defined(NSINTEGER_DEFINED) && NSINTEGER_DEFINED
    if([item respondsToSelector:@selector(unsignedIntegerValue)])
        value = [item unsignedIntegerValue];
    else if([item respondsToSelector:@selector(integerValue)])
        value = [item integerValue];
#else
    if(NO) /* do nothing */;
#endif
    else if([item respondsToSelector:@selector(unsignedIntValue)])
        value = [item unsignedIntValue];
    else if([item respondsToSelector:@selector(intValue)])
        value = [item intValue];
    else
        return NO;
    
    return NSLocationInRange(value, [self rangeValue]);
}

@end

id<HCMatcher> HC_locationInRange(NSRange aRange)
{
    return [HCIsLocationInRange isLocationInRange:aRange];
}
