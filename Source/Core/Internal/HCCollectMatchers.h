//
//  OCHamcrest - HCCollectMatchers.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Mac
#import <Foundation/Foundation.h>
#import "HCDefines.h"

@protocol HCMatcher;

/**
    Returns an array of matchers from a variable-length comma-separated list terminated by @c nil.
*/
OCHAMCREST_EXPORT NSMutableArray* HC_collectMatchers(id<HCMatcher> matcher, va_list args);
