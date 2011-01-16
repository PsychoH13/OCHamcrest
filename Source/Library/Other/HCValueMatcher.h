//
//  HCValueMatcher.h
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HCDefines.h"
#import "HCBaseMatcher.h"

@interface HCValueMatcher : HCBaseMatcher
{
@private
    NSValue *_value;
}

+ (id)valueMatcherWithValue:(NSValue *)aValue;
- (id)initWithValue:(NSValue *)aValue;

@property(nonatomic, copy, readonly) NSValue *valueObject;

@end
