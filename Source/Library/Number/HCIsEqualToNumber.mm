//
//  OCHamcrest - HCIsEqualToNumber.mm
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

    // Self
#import "HCIsEqualToNumber.h"

    // OCHamcrest
#import "HCBoxNumber.h"
#import "HCIsEqual.h"
using namespace hamcrest;


#define defineEqualToNumber(name, type)                 \
    id<HCMatcher> HC_equalTo ## name(type value)        \
    {                                                   \
        return [HCIsEqual isEqualTo:boxNumber(value)];  \
    }


__BEGIN_DECLS

defineEqualToNumber(Bool, BOOL)
defineEqualToNumber(Char, char)
defineEqualToNumber(Double, double)
defineEqualToNumber(Float, float)
defineEqualToNumber(Int, int)
defineEqualToNumber(Long, long)
defineEqualToNumber(LongLong, long long)
defineEqualToNumber(Short, short)
defineEqualToNumber(UnsignedChar, unsigned char)
defineEqualToNumber(UnsignedInt, unsigned int)
defineEqualToNumber(UnsignedLong, unsigned long)
defineEqualToNumber(UnsignedLongLong, unsigned long long)
defineEqualToNumber(UnsignedShort, unsigned short)

#if defined(NSINTEGER_DEFINED) && NSINTEGER_DEFINED
defineEqualToNumber(Integer, NSInteger)
defineEqualToNumber(UnsignedInteger, NSUInteger)
#endif  // Objective-C 2.0

__END_DECLS
