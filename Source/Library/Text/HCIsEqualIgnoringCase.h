//
//  OCHamcrest - HCIsEqualIgnoringCase.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCBaseMatcher.h"


/**
    Tests if a string is equal to another string, regardless of the case.
*/
@interface HCIsEqualIgnoringCase : HCBaseMatcher
{
    NSString* string;
}

+ (HCIsEqualIgnoringCase*) isEqualIgnoringCase:(NSString*)aString;
- (id) initWithString:(NSString*)aString;

@end


OCHAMCREST_EXPORT id<HCMatcher> HC_equalToIgnoringCase(NSString* aString);


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_endsWith, available if HC_SHORTHAND is defined.
*/
#define equalToIgnoringCase HC_equalToIgnoringCase

#endif
