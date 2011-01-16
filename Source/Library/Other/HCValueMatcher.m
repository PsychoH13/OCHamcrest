//
//  HCValueMatcher.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCValueMatcher.h"

#import "HCDescription.h"

@implementation HCValueMatcher
@synthesize valueObject = _value;

+ (id)valueMatcherWithValue:(NSValue *)aValue;
{
    return [[[self alloc] initWithValue:aValue] autorelease];
}

- (id)initWithValue:(NSValue *)aValue;
{
    if((self = [super init]))
        _value = [aValue copy];
    
    return self;
}

+ (BOOL)instancesRespondToSelector:(SEL)aSelector
{
    return [super instancesRespondToSelector:aSelector] || [NSValue instancesRespondToSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector;
{
    return [super respondsToSelector:aSelector] || [_value respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return _value;
}

- (BOOL)isEqual:(id)object
{
    if([object isKindOfClass:[HCValueMatcher class]])
        return [[self valueObject] isEqualToValue:[object valueObject]];
    else if([object isKindOfClass:[NSValue class]])
        return [[self valueObject] isEqualToValue:object];
    
    return [super isEqual:object];
}

- (void)describeTo:(id <HCDescription>)description
{
    [description appendValue:self];
}

- (NSString *)description
{
    return [_value description];
}

- (void)dealloc
{
    [_value release];
    [super dealloc];
}

@end
