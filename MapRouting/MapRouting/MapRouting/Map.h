//
//  Map.h
//  MapRouting
//
//  Created by ggordon22 on 5/25/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef Map_h
#define Map_h
#import "City.h"
#import "PathNode.h"
#import "Heap.h"

@interface Map : NSObject
@property int numberOfCities;
@property int numberOfConnections;
@property NSMutableArray *listOfCities; //array with all cities
@property NSMutableArray *citiesWithShortestDistance; //saves distances for efficiency
-(PathNode *) DijsktraAlgorithmWithStart: (int) start andEnd: (int) end;

@end

#endif /* Map_h */
