//
//  HCInvalidRange.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCRangeAssert.h"

@interface HCEmptyRange : HCRangeMatcher

+ (HCEmptyRange *)emptyRange;

@end

/**
 Is the range empty, as tested by range.length == 0
 */
OCHAMCREST_EXPORT id<HCMatcher> HC_emptyRange(void);


#ifdef HC_SHORTHAND

/**
 Shorthand for HC_equalTo, available if HC_SHORTHAND is defined.
 */
#define emptyRange HC_emptyRange

#endif
