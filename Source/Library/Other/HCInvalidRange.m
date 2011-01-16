//
//  HCInvalidRange.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCInvalidRange.h"

#import "HCDescription.h"
#import "HCMatcherAssert.h"

#import "HCIsNot.h"

@implementation HCInvalidRange

+ (id)invalidRange;
{
    return [self rangeMatcherWithRange:NSMakeRange(NSNotFound, 0)];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(rangeValue)])
        return NO;
    
    return [item rangeValue].location == NSNotFound;
}

- (void)describeTo:(id <HCDescription>)description
{
    [description appendText:@"invalid range"];
}

@end

@implementation HCValidRange

+ (id)validRange;
{
    return [self invalidRange];
}


- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(rangeValue)])
        return NO;
    
    return ![super matches:item];
}

- (void)describeTo:(id <HCDescription>)description
{
    [description appendText:@"valid range"];
}

@end


id<HCMatcher> HC_invalidRange(void)
{
    return [HCInvalidRange invalidRange];
}

id<HCMatcher> HC_validRange(void)
{
    return [HCValidRange validRange];
}
