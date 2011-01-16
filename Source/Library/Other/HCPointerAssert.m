//
//  HCPointerAssert.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import "HCPointerAssert.h"

#import "HCDescription.h"
#import "HCMatcherAssert.h"

void HC_assertThatPointerWithLocation(id testCase, void *actual, id<HCMatcher> matcher, const char* fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [HCPointerMatcher pointerMatcherWithPointer:actual], matcher, fileName, lineNumber);
}

@implementation HCPointerMatcher
@synthesize pointerValue = _pointer;

+ (id)pointerMatcherWithPointer:(void *)equalArg;
{
    return [[[self alloc] initWithPointer:equalArg] autorelease];
}

- (id)initWithPointer:(void *)aPointer
{
    if((self = [super init]))
        _pointer = aPointer;
    
    return self;
}

- (void)describeTo:(id<HCDescription>)description
{
    [description appendText:[NSString stringWithFormat:@"pointer <%p>", _pointer]];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%p", _pointer];
}

- (BOOL)isEqual:(id)object
{
    if([super isEqual:object]) return YES;
    
    if([object respondsToSelector:@selector(pointerValue)])
        return [object pointerValue] == _pointer;
    
    return NO;
}

@end
