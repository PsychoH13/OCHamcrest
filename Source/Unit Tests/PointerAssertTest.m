//
//  PointerAssertTest.m
//  OCHamcrest
//
//  Created by Remy Demarest on 15/01/2011.
//  Copyright 2011 NuLayer Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#import "HCPointerAssert.h"
#import "HCIsEqual.h"

@interface PointerAssertTest : SenTestCase
@end


@implementation PointerAssertTest

- (void)setUp
{
    [self raiseAfterFailure];
}

- (void)testSuccessWithPointer
{
    assertThatPointer(NULL, equalTo([NSValue valueWithPointer:NULL]));
}

- (void)testFailureWithPointer
{
    int i = 0;
    @try
    {
        assertThatPointer(&i, equalTo([NSValue valueWithPointer:NULL]));
    }
    @catch(NSException *exception)
    {
        NSString *expectedReason =
#if __LP64__
        [NSString stringWithFormat:@"Expected <<00000000 00000000>>, got <%p>", &i];
#else
        [NSString stringWithFormat:@"Expected <<00000000>>, got <%p>", &i];
#endif
        STAssertEqualObjects(expectedReason, [exception reason], nil);
        return;
    }
    STFail(@"should have failed");
}

@end
