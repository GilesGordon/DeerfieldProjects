//
//  main.m
//  SortingAlgorithms
//
//  Created by ggordon22 on 4/22/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sorter.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //time_t time(time_t *second);
        //NSLog(@"%ld", seconds);
        int array[2000000]; //1000 and 10000
        for (int i=0; i<2000000; i++) {
            array[i]= arc4random_uniform(100);
        }

        int size = (sizeof(array)/sizeof(array[0]));
//        for(int i=0; i<size; i++){
//            NSLog(@"%i", array[i]);
//        }
//        //long seconds = time(NULL);
        long startTime = clock();
        //[Sorter selectiveSort: array withSize: size];
        int * mergedArray = [Sorter mergeSort: array withSize:size];
        //NSLog(@"%i",[Sorter binarySearch:array withSize:size forNumb:17]);
        long endTime = clock();
//        //long newSeconds = time(NULL) - seconds;

//        for(int i=0; i<size; i++){
//            NSLog(@"%i", array[i]); //
//        }
        
        //for merged array
//        for(int i=0; i<size; i++){
//            NSLog(@"%i", mergedArray[i]);
//        }
        
        NSLog(@"%ld", endTime - startTime);


        //NSLog(@"%i", [Sorter binarySearch:mergedArray withSize:size forNumb:10]);
        //NSLog(@"The number of numbers until a repeat including the repeat is: %i", [Sorter birthdayProblem]);
    
    }
    return 0;
}
