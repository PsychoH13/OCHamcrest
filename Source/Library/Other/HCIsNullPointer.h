//
//  HCIsNullPointer.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCDefines.h"
#import "HCPointerAssert.h"


@interface HCIsNull : HCPointerMatcher
+ (HCIsNull *)isNull;
@end

/**
 Matches if the value is @c Null.
 */
OCHAMCREST_EXPORT id<HCMatcher> HC_nullValue(void);

/**
 Matches if the value is not @c Null.
 */
OCHAMCREST_EXPORT id<HCMatcher> HC_notNullValue(void);


#ifdef HC_SHORTHAND

/**
 Shorthand for HC_nilValue, available if HC_SHORTHAND is defined.
 */
#define nullValue HC_nullValue

/**
 Shorthand for HC_notNilValue, available if HC_SHORTHAND is defined.
 */
#define notNullValue HC_notNullValue

#endif
