//
//  OCHamcrest - HCIsNil.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCBaseMatcher.h"


/**
    Is the value @c nil?
*/
@interface HCIsNil : HCBaseMatcher
{
}

+ (HCIsNil*) isNil;

@end


/**
    Matches if the value is @c nil.
*/
OCHAMCREST_EXPORT id<HCMatcher> HC_nilValue();

/**
    Matches if the value is not @c nil.
*/
OCHAMCREST_EXPORT id<HCMatcher> HC_notNilValue();


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_nilValue, available if HC_SHORTHAND is defined.
*/
#define nilValue HC_nilValue

/**
    Shorthand for HC_notNilValue, available if HC_SHORTHAND is defined.
*/
#define notNilValue HC_notNilValue

#endif
