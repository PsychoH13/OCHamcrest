//
//  OCHamcrest - HCAllOf.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCDefines.h"
#import "HCBaseMatcher.h"


/**
    Calculates the logical conjunction of multiple matchers.
    
    Evaluation is shortcut, so subsequent matchers are not called if an earlier matcher returns
    @c NO.
*/
@interface HCAllOf : HCBaseMatcher
{
    NSArray* matchers;
}

+ (HCAllOf*) allOf:(NSArray*)theMatchers;
- (id) initWithMatchers:(NSArray*)theMatchers;

@end

/**
    Evaluates to @c YES only if @b all of the passed in matchers evaluate to @c YES.
    
    @param matcher Comma-separated list of matchers ending with @c nil.
*/
OCHAMCREST_EXPORT id<HCMatcher> HC_allOf(id<HCMatcher> matcher, ...);


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_allOf, available if HC_SHORTHAND is defined.
*/
#define allOf HC_allOf

#endif
