//
//  OCHamcrest - HCIsSame.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCBaseMatcher.h"


/**
    Is the value the same object as another value?
*/
@interface HCIsSame : HCBaseMatcher
{
    id object;
}

+ (HCIsSame*) isSameAs:(id)anObject;
- (id) initSameAs:(id)anObject;

@end


/**
    Evaluates to @c YES only when the argument is this same object.
*/
OCHAMCREST_EXPORT id<HCMatcher> HC_sameInstance(id anObject);


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_sameInstance, available if HC_SHORTHAND is defined.
*/
#define sameInstance HC_sameInstance

#endif
