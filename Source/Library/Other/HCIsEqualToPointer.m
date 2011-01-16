//
//  HCIsEqualToPointer.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCIsEqualToPointer.h"

#import "HCDescription.h"

@implementation HCIsEqualToPointer

+ (HCIsEqualToPointer *)isEqualToPointer:(void *)equalArg;
{
    return [self pointerMatcherWithPointer:equalArg];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(pointerValue)])
        return NO;
    
    return [item pointerValue] == [self pointerValue];
}

@end

id<HCMatcher> HC_equalToPointer(void *equalArg)
{
    return [HCIsEqualToPointer isEqualToPointer:equalArg];
}
