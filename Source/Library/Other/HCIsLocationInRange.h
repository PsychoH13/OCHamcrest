//
//  HCRange.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCRangeAssert.h"

@interface HCIsLocationInRange : HCRangeMatcher

+ (HCIsLocationInRange *)isLocationInRange:(NSRange)aRange;

@end

/**
    Is the integer value in range, as tested by the NSLocationInRange function?
*/
OCHAMCREST_EXPORT id<HCMatcher> HC_locationInRange(NSRange aRange);
    

#ifdef HC_SHORTHAND

/**
 Shorthand for HC_locationInRange, available if HC_SHORTHAND is defined.
 */
#define locationInRange HC_locationInRange

#endif
