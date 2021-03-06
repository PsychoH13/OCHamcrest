//
//  OCHamcrest - OCHamcrest.h
//  Copyright 2009 www.hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid
//

#import "HCDefines.h"

    // Unit test integration
#import "HCMatcherAssert.h"
#import "HCNumberAssert.h"

    // Core
#import "HCAllOf.h"
#import "HCAnyOf.h"
#import "HCDescribedAs.h"
#import "HCIs.h"
#import "HCIsAnything.h"
#import "HCIsEqual.h"
#import "HCIsInstanceOf.h"
#import "HCIsNil.h"
#import "HCIsNot.h"
#import "HCIsSame.h"

    // Library: Collection
#import "HCIsCollectionContaining.h"
#import "HCIsCollectionOnlyContaining.h"
#import "HCIsDictionaryContaining.h"
#import "HCIsDictionaryContainingKey.h"
#import "HCIsDictionaryContainingValue.h"
#import "HCIsIn.h"

    // Library: Number
#import "HCIsCloseTo.h"
#import "HCIsEqualToNumber.h"
#import "HCOrderingComparison.h"

    // Library: Object
#import "HCHasDescription.h"

    // Library: Text
#import "HCIsEqualIgnoringCase.h"
#import "HCIsEqualIgnoringWhiteSpace.h"
#import "HCStringContains.h"
#import "HCStringEndsWith.h"
#import "HCStringStartsWith.h"

    // Library: Other
#import "HCValueMatcher.h"

    // Library: Pointer
#import "HCPointerAssert.h"
#import "HCIsEqualToPointer.h"
#import "HCIsNullPointer.h"

    // Library: Range
#import "HCRangeAssert.h"
#import "HCIsEqualToRange.h"
#import "HCIsLocationInRange.h"
#import "HCInvalidRange.h"
#import "HCEmptyRange.h"

    // Library: Point
#import "HCPointAssert.h"
#import "HCIsEqualToPoint.h"

    // Library: Size
#import "HCSizeAssert.h"
#import "HCIsEqualToSize.h"

    // Library: Rect
#import "HCRectAssert.h"
#import "HCIsEqualToRect.h"
#import "HCIntersectsRect.h"
#import "HCContainsRect.h"
#import "HCContainedInRect.h"
#import "HCEmptyRect.h"
#import "HCNullRect.h"
#import "HCInfiniteRect.h"
