//
//  OCHamcrest - HCIsDictionaryContainingKey.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCBaseMatcher.h"


@interface HCIsDictionaryContainingKey : HCBaseMatcher
{
    id<HCMatcher> keyMatcher;
}

+ (HCIsDictionaryContainingKey*) isDictionaryContainingKey:(id<HCMatcher>)theKeyMatcher;
- (id) initWithKeyMatcher:(id<HCMatcher>)theKeyMatcher;

@end


OCHAMCREST_EXPORT id<HCMatcher> HC_hasKey(id item);


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_hasKey, available if HC_SHORTHAND is defined.
*/
#define hasKey HC_hasKey

#endif
