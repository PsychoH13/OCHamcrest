//
//  HCIsEqualToPointer.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCPointerAssert.h"

@protocol HCMatcher;

@interface HCIsEqualToPointer : HCPointerMatcher

+ (HCIsEqualToPointer *)isEqualToPointer:(void *)aPointer;

@end

/**
 Is the pointer equal to another pointer, as tested by == operator
 */
OCHAMCREST_EXPORT id<HCMatcher> HC_equalToPointer(void *equalArg);


#ifdef HC_SHORTHAND

/**
 Shorthand for HC_equalTo, available if HC_SHORTHAND is defined.
 */
#define equalToPointer HC_equalToPointer

#endif
