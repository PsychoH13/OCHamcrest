//
//  OCHamcrest - HCIsEqual.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCBaseMatcher.h"


/**
    Is the object equal to another object, as tested by the isEqual: method?
*/
@interface HCIsEqual : HCBaseMatcher
{
    id object;
}

+ (HCIsEqual*) isEqualTo:(id)equalArg;
- (id) initEqualTo:(id)equalArg;

@end


/**
    Is the object equal to another object, as tested by the isEqual: method?
*/
OCHAMCREST_EXPORT id<HCMatcher> HC_equalTo(id equalArg);


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_equalTo, available if HC_SHORTHAND is defined.
*/
#define equalTo HC_equalTo

#endif
