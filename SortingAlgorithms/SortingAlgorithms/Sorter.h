//
//  Sorter.h
//  SortingAlgorithms
//
//  Created by ggordon22 on 4/22/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef Sorter_h
#define Sorter_h

@interface Sorter : NSObject

+(void) selectiveSort: (int []) arr withSize: (int) size;
+(int *) mergeSort:(int []) arr withSize: (int) size;
+(int *) merge:(int []) arr1 withSize: (int) size withSecondArray: (int []) arr2 withSecondSize: (int) secondSize;
+(int) binarySearch:(int []) arr withSize: (int) size forNumb: (int) number;
+(int) binarySearchAlgorithm:(int []) arr forNumb: (int) number withLow: (int) low withHigh: (int) high;
+(int) birthdayProblem;
@end

#endif /* Sorter_h */
