/*
 OCHamcrest - HCPointerAssert.m
 
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
