//
//  OCHamcrest - HCStringEndsWith.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCSubstringMatcher.h"


/**
    Tests if the argument is a string that ends with a substring.
*/
@interface HCStringEndsWith : HCSubstringMatcher
{
}

+ (HCStringEndsWith*) stringEndsWith:(NSString*)aSubstring;

@end


OCHAMCREST_EXPORT id<HCMatcher> HC_endsWith(NSString* aSubstring);


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_endsWith, available if HC_SHORTHAND is defined.
*/
#define endsWith HC_endsWith

#endif
