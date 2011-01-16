//
//  OCHamcrest - HCWrapInMatcher.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCDefines.h"

@protocol HCMatcher;


/**
    Returns @a item wrapped (if necessary) in an HCIsEqual matcher.
    
    @a item is returned as-is if it is already an HCMatcher.
*/
OCHAMCREST_EXPORT id<HCMatcher> HC_wrapInMatcher(id item);
