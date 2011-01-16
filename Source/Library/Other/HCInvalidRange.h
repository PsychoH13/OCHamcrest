//
//  HCInvalidRange.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCRangeAssert.h"

@interface HCInvalidRange : HCRangeMatcher

+ (id)invalidRange;

@end

@interface HCValidRange : HCInvalidRange

+ (id)validRange;

@end


/**
 Is the range is invalid, as test by range.location == NSNotFound
 */
OCHAMCREST_EXPORT id<HCMatcher> HC_invalidRange(void);

OCHAMCREST_EXPORT id<HCMatcher> HC_validRange(void);

#ifdef HC_SHORTHAND

/**
 Shorthand for HC_invalidRange, available if HC_SHORTHAND is defined.
 */
#define invalidRange HC_invalidRange

#define validRange HC_validRange

#endif
