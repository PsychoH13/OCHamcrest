//
//  HCIsEqualToRange.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCIsEqualToRange.h"

#import "HCDescription.h"

@implementation HCIsEqualToRange

+ (HCIsEqualToRange *)isEqualToRange:(NSRange)equalArg;
{
    return [self rangeMatcherWithRange:equalArg];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(rangeValue)])
        return NO;
    
    return NSEqualRanges([item rangeValue], [self rangeValue]);
}

@end


id<HCMatcher> HC_equalToRange(NSRange equalArg)
{
    return [HCIsEqualToRange isEqualToRange:equalArg];
}
