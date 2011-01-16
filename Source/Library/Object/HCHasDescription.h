//
//  OCHamcrest - HCHasDescription.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCInvocationMatcher.h"


/**
    Does the object's description satisfy a given matcher?
*/
@interface HCHasDescription : HCInvocationMatcher
{
}

+ (HCHasDescription*) hasDescription:(id<HCMatcher>)descriptionMatcher;
- (id) initWithDescription:(id<HCMatcher>)descriptionMatcher;

@end


/**
    Evaluates whether [item description] satisfies a given matcher.

    Example: hasDescription(equalTo(result))
*/
OCHAMCREST_EXPORT id<HCMatcher> HC_hasDescription(id item);


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_hasDescription, available if HC_SHORTHAND is defined.
*/
#define hasDescription HC_hasDescription

#endif
