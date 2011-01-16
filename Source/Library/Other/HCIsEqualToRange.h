//
//  HCIsEqualToRange.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCRangeAssert.h"

@interface HCIsEqualToRange : HCRangeMatcher

+ (HCIsEqualToRange *)isEqualToRange:(NSRange)equalArg;

@end

/**
 Is the range equal to another range, as tested by the NSEqualRanges function?
 */
OCHAMCREST_EXPORT id<HCMatcher> HC_equalToRange(NSRange equalArg);


#ifdef HC_SHORTHAND

/**
 Shorthand for HC_equalTo, available if HC_SHORTHAND is defined.
 */
#define equalToRange HC_equalToRange

#endif
