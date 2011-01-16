//
//  OCHamcrest - HCIntegerTypes.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

/**
    \file
    Define Leopard integer types for Tiger
*/

#if !defined(NSINTEGER_DEFINED) || !NSINTEGER_DEFINED

// Define 32-bit types only. I presume that anyone in 64-bit is not building for Tiger.

typedef int NSInteger;
typedef unsigned int NSUInteger;

#endif
