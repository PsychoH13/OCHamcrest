//
//  OCHamcrest - HCMatcherAssert.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCMatcherAssert.h"

    // OCHamcrest
#import "HCStringDescription.h"
#import "HCMatcher.h"

    // Objective-C
#import <objc/runtime.h>
#import <objc/message.h>

@interface NSException ()
+ (NSException *)failureInFile:(NSString *)filename atLine:(int)lineNumber withDescription:(NSString *)formatString, ...;
@end

NSException *HCCreateAssertThatFailure(const char *fileName, int lineNumber, NSString *description)
{
    // If the Hamcrest client has linked to OCUnit, generate an OCUnit failure.
    if (NSClassFromString(@"SenTestCase") != Nil)
        return [NSException failureInFile:[NSString stringWithUTF8String:fileName] atLine:lineNumber withDescription:description];

    NSString *failureReason = [NSString stringWithFormat:@"%s:%d: matcher error: %@",
                               fileName, lineNumber, description];
    
    return [NSException exceptionWithName:@"Hamcrest Error" reason:failureReason userInfo:nil];
}

@interface NSObject (SpecFailureMethodDeclarationForQuietingTheCompiler)
- (void)failWithException:(NSException *)exception;
@end

void HC_assertThatWithLocation(id testCase, id actual, id<HCMatcher> matcher,
                               const char* fileName, int lineNumber)
{
    if (![matcher matches:actual])
    {
        HCStringDescription* description = [HCStringDescription stringDescription];
        [[[[description appendText:@"Expected "]
                        appendDescriptionOf:matcher]
                        appendText:@", got "]
                        appendValue:actual];
        NSException* assertThatFailure = HCCreateAssertThatFailure(fileName, lineNumber, [description description]);
        
        [testCase failWithException:assertThatFailure];
    }
}
