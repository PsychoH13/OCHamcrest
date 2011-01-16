//
//  OCHamcrest - HCStringContains.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCSubstringMatcher.h"


/**
    Tests if the argument is a string that contains a substring.
*/
@interface HCStringContains : HCSubstringMatcher
{
}

+ (HCStringContains*) stringContains:(NSString*)aSubstring;

@end


OCHAMCREST_EXPORT id<HCMatcher> HC_containsString(NSString* aSubstring);


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_containsString, available if HC_SHORTHAND is defined.
*/
#define containsString HC_containsString

#endif
