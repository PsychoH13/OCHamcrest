//
//  OCHamcrest - HCIsEqualIgnoringWhiteSpace.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Inherited
#import "HCBaseMatcher.h"


/**
    Tests if a string is equal to another string, ignoring any changes in whitespace.
*/
@interface HCIsEqualIgnoringWhiteSpace : HCBaseMatcher
{
    NSString* originalString;
    NSString* strippedString;
}

+ (HCIsEqualIgnoringWhiteSpace*) isEqualIgnoringWhiteSpace:(NSString*)aString;
- (id) initWithString:(NSString*)aString;

@end


OCHAMCREST_EXPORT id<HCMatcher> HC_equalToIgnoringWhiteSpace(NSString* aString);


#ifdef HC_SHORTHAND

/**
    Shorthand for HC_endsWith, available if HC_SHORTHAND is defined.
*/
#define equalToIgnoringWhiteSpace HC_equalToIgnoringWhiteSpace

#endif
