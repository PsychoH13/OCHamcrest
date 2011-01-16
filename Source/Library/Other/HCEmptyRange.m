//
//  HCInvalidRange.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCEmptyRange.h"

#import "HCDescription.h"
#import "HCMatcherAssert.h"

@implementation HCEmptyRange

+ (HCEmptyRange *)emptyRange;
{
    return [self rangeMatcherWithRange:NSMakeRange(NSNotFound, 0)];
}

- (BOOL)matches:(id)item
{
    if(![item respondsToSelector:@selector(rangeValue)])
        return NO;
    
    return [item rangeValue].length == 0;
}

- (void)describeTo:(id <HCDescription>)description
{
    [description appendText:@"empty range"];
}

@end


id<HCMatcher> HC_emptyRange(void)
{
    return [HCEmptyRange emptyRange];
}
