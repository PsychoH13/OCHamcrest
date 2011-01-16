//
//  OCHamcrest - HCIsIn.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCBaseMatcher.h"


@interface HCIsIn : HCBaseMatcher
{
    id collection;
}

+ (HCIsIn*) isInCollection:(id)aCollection;
- (id) initWithCollection:(id)aCollection;

@end


OCHAMCREST_EXPORT id<HCMatcher> HC_isIn(id collection);


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_isIn, available if HC_SHORTHAND is defined.
*/
#define isIn HC_isIn

#endif
