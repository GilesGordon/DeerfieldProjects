//
//  Sorter.m
//  SortingAlgorithms
//
//  Created by ggordon22 on 4/22/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sorter.h"

@implementation Sorter: NSObject

+(void) selectiveSort: (int []) arr withSize: (int) size {
    int max;
    int maxIndex;
    int temp;
    for(int i=0; i<size; i++) {
        max = arr[0];
        maxIndex = 0;
        for (int j=1; j<size - i; j++) {
            if (arr[j] > max) {
                max = arr[j];
                maxIndex = j;
            }
        }
        temp = arr[size-i-1];
        arr[size-i-1] = arr[maxIndex];
        arr[maxIndex] = temp;
    }
}

+(int *) mergeSort:(int []) arr withSize: (int) size{
    if (size == 1) {
        return arr;
    } else {
        int *arr1 = malloc(sizeof(int) * (size/2));
        int *arr2 = malloc(sizeof(int) * (size-size/2));
        for (int i = 0; i< size/2; i++) {
            arr1[i] = arr[i];
        }
        for (int i = 0; i< size - size/2; i++) {
            arr2[i] = arr[i + size/2];
        }
        return [self merge: [self mergeSort:arr1 withSize: size/2] withSize: size/2 withSecondArray: [self mergeSort: arr2 withSize: size-size/2] withSecondSize:size-size/2];
    }
}

+(int *) merge:(int []) arr1 withSize: (int) size withSecondArray: (int []) arr2 withSecondSize: (int) secondSize{
    int firstIndex = 0;
    int secondIndex = 0;
    int *mergeArr = malloc(sizeof(int) * (size+secondSize));
    for (int i = 0; i<(size + secondSize); i++) {
        if (firstIndex == size) {
            for (int j = 0; j < secondSize - secondIndex; j++) {
                mergeArr[(size+secondSize) - j - 1] = arr2[secondSize - j - 1];
            }
            break;
        } else if (secondIndex == secondSize) {
            for (int j = 0; j < size - firstIndex; j++) {
                mergeArr[(size+secondSize) - j - 1] = arr1[size - j - 1];
            }
            break;
        } else {
            if (arr1[firstIndex] <= arr2[secondIndex]){
                mergeArr[i] = arr1[firstIndex];
                firstIndex++;
            } else {
                mergeArr[i] = arr2[secondIndex];
                secondIndex++;
            }
        }
    }
    return mergeArr;
}

+(int) binarySearch:(int []) arr withSize: (int) size forNumb: (int) number {
   return [self binarySearchAlgorithm:arr forNumb:number withLow:0 withHigh:size];
}

+(int) binarySearchAlgorithm:(int []) arr forNumb: (int) number withLow: (int) low withHigh: (int) high {
    NSLog(@"called");
    //way to measure time
    int checkNumber = arr[(high-low)/2+low];
    if (checkNumber == number) {
        return (high-low)/2+low;
    } else if (low == high - 1) {
            return -1;
    } else {
        if (checkNumber > number) {
            return [self binarySearchAlgorithm:arr forNumb: number withLow:low withHigh:(high-low)/2+low];
        } else {
            return [self binarySearchAlgorithm:arr forNumb: number withLow:(high-low)/2+low withHigh: high];
        }
    }
}

+(int) birthdayProblem {
    int N;
    NSLog(@"Enter range for random generator:");
    scanf("%d", &N);
    NSMutableArray* registeredValues = [[NSMutableArray alloc]init];
    int numberUntilRepeated = 0;
    while (true) {
        NSString* newIntString = [NSString stringWithFormat: @"%i", arc4random_uniform(N)];
        if ([registeredValues containsObject:newIntString] == false) {
            numberUntilRepeated++;
            [registeredValues addObject: newIntString];
        } else {
            numberUntilRepeated++;
            [registeredValues addObject: newIntString];
            break;
        }
    }
    for (int i = 0; i<registeredValues.count; i++) {
        NSLog(@"%@", registeredValues[i]);
    }
    return numberUntilRepeated;
}
@end
