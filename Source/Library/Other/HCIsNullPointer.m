//
//  HCIsNullPointer.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCIsNullPointer.h"

#import "HCIsNot.h"

#import "HCDescription.h"

@implementation HCIsNull

+ (HCIsNull *)isNull
{
    return [self pointerMatcherWithPointer:NULL];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(pointerValue)])
        return NO;
    
    return [item pointerValue] == NULL;
}

- (void)describeTo:(id <HCDescription>)description
{
    [description appendText:@"NULL"];
}

@end

id<HCMatcher> HC_nullValue(void)
{
    return [HCIsNull isNull];
}


id<HCMatcher> HC_notNullValue(void)
{
    return HC_isNot([HCIsNull isNull]);
}
