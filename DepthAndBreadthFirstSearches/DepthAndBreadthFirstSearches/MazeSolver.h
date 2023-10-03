//
//  MazeSolver.h
//  DepthAndBreadthFirstSearches
//
//  Created by ggordon22 on 4/16/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef MazeSolver_h
#define MazeSolver_h
#import "Stack.h"
#import "Queue.h"
#import "Square.h"

@interface MazeSolver: NSObject

@property NSString* mazeString;
@property NSInteger textLength;
@property NSInteger startIndex;
@property NSInteger endIndex;

-(Stack*) solveTheMazeDepth;
-(NSMutableArray*) solveTheMazeBreadth;
@end

#endif /* MazeSolver_h */
