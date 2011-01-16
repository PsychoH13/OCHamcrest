/*
 OCHamcrest - HCValueMatcher.m
 
 Created by Remy "Psy" Demarest on 15/01/2011.
 
 Copyright (c) 2011 Remy "Psy" Demarest
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

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
