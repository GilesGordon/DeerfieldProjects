//
//  Map.m
//  MapRouting
//
//  Created by ggordon22 on 5/25/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Map.h"
#include "math.h"
@implementation Map : NSObject

-(PathNode *) DijsktraAlgorithmWithStart: (int) start andEnd: (int) end { //returns the end pathNode which and all path nodes have previous nodes stored
    Heap * pathNodeHeap = [[Heap alloc]init];
    PathNode *currentPathNode = [[PathNode alloc] initWithCurrentCity:start previousCity:nil andDistanceFromStart:0];
    [pathNodeHeap addObject:currentPathNode withKey:currentPathNode.distanceFromStart];
    City *nCity = [[City alloc]init];
    City *cCity = [[City alloc]init];
    int nextCity;
    
    while (currentPathNode.currentCity != end && pathNodeHeap.size != 0) {
        //test
//         nextCity = (int)[((City *)self.listOfCities[currentPathNode.currentCity]).connections[0] integerValue];
       // int connections = ((City *)self.listOfCities[currentPathNode.currentCity]).numberOfCityConnections;
        
        currentPathNode = [pathNodeHeap removeMin];
        //NSLog(@"%i", currentPathNode.currentCity);
        
        for (int i = 0; i < ((City *)self.listOfCities[currentPathNode.currentCity]).numberOfCityConnections; i++){ //for the current city's number of connection times:
            nextCity = (int)[((City *)self.listOfCities[currentPathNode.currentCity]).connections[i] integerValue];
            if ([self visitedCity:nextCity fromPathNode:currentPathNode withStart: start] != true) { //stops from going in loops
                nCity = self.listOfCities[nextCity];
                cCity = (City *)self.listOfCities[currentPathNode.currentCity];
                
                //pythagorean between cities and adds to total distance
                double newDistanceFromStart = currentPathNode.distanceFromStart + sqrt(pow(nCity.x-cCity.x, 2) + pow(nCity.y-cCity.y, 2));
                    if (newDistanceFromStart < [self.citiesWithShortestDistance[nextCity] integerValue] || [self.citiesWithShortestDistance[nextCity] isEqualToString: @""]) { //makes it so that if there was a shorter way to get to the same city, it's not added to the heap
                        self.citiesWithShortestDistance[nextCity] = [NSString stringWithFormat:@"%G" , newDistanceFromStart];
                        PathNode * newNode = [[PathNode alloc]initWithCurrentCity:nextCity previousCity:currentPathNode andDistanceFromStart:newDistanceFromStart];
                        [pathNodeHeap addObject: newNode withKey: newNode.distanceFromStart]; //gives int value?
                    }
                }
            }
        
        int x = 1;
        }
    if (pathNodeHeap.size == 0 && currentPathNode.currentCity != end) {
        return nil;
        }
    return currentPathNode;
    }

-(BOOL) visitedCity: (int) nextCity fromPathNode: (PathNode *) currentPathNode withStart: (int) start { //fixes crossing over paths by checking over all previous nddes
    if (nextCity == start) {
        return true;
    }
    PathNode * tempPathNode = [[PathNode alloc] init];
    tempPathNode = currentPathNode;
    while (tempPathNode.currentCity != start) {
        if (tempPathNode.currentCity == nextCity) {
            return true;
        }
        tempPathNode = tempPathNode.previousPathNode;
    }
    return false;
}

@end
