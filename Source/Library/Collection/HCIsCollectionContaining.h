//
//  OCHamcrest - HCIsCollectionContaining.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCBaseMatcher.h"


@interface HCIsCollectionContaining : HCBaseMatcher
{
    id<HCMatcher> elementMatcher;
}

+ (HCIsCollectionContaining*) isCollectionContaining:(id<HCMatcher>)anElementMatcher;
- (id) initWithMatcher:(id<HCMatcher>)anElementMatcher;

@end


OCHAMCREST_EXPORT id<HCMatcher> HC_hasItem(id item);

/**
    @param item comma-separated list of items ending with nil.
*/
OCHAMCREST_EXPORT id<HCMatcher> HC_hasItems(id item, ...);


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_hasItem, available if HC_SHORTHAND is defined.
*/
#define hasItem HC_hasItem

/**
    Shorthand for HC_hasItems, available if HC_SHORTHAND is defined.
*/
#define hasItems HC_hasItems

#endif
