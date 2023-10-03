//
//  MazeSolver.m
//  DepthAndBreadthFirstSearches
//
//  Created by ggordon22 on 4/16/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MazeSolver.h"

@implementation MazeSolver: NSObject

- (Stack*) solveTheMazeDepth{
    Stack* pathStack = [[Stack alloc]init];
    Stack* processStack = [[Stack alloc]init];
    Node* startNode = [[Node alloc]init];
    NSString* nodeObject = [NSString stringWithFormat:@"%ld,1",self.startIndex]; //index and direction are both in a string divided by a comma
    NSString* topStringIndex;
    NSString* topDirection;
    [startNode setObject: nodeObject];
    [pathStack setTop: startNode];
    [processStack setTop: startNode];
    
    NSArray* topComponents = [pathStack.top.object componentsSeparatedByString:@","];
    topStringIndex = topComponents.firstObject;
    topDirection = topComponents.lastObject;

    NSMutableArray* allVisitedNodes = [[NSMutableArray alloc]init];
    [allVisitedNodes addObject:topStringIndex];
    
    while ([topStringIndex isEqualToString: [NSString stringWithFormat:@"%ld",self.endIndex]] == false) {
        NSString * nextObject;
  
        //going right
        if ([topDirection integerValue] == 1) {
            //checks if next node is valid
            /* If the first check is false than it wont give an out of bounds for the substring range in the next check, and although it works for me, I'm not entirely sure if you can do this on later versions of Xcode since I think I got a warning about it, but I'm not sure. So please let me know if it gives an error for you.*/
            if ((([topStringIndex integerValue] +1)%self.textLength)+1 != self.textLength && [[self.mazeString substringWithRange:NSMakeRange([topStringIndex integerValue] +1, 1)] isEqualToString: @"#"] == false && [allVisitedNodes containsObject:[NSString stringWithFormat: @"%ld", [topStringIndex integerValue] +1]] == false) {
                nextObject = [NSString stringWithFormat:@"%ld,%i",[topStringIndex integerValue] +1, 1];
                [pathStack push:nextObject];
                [processStack push:nextObject];
            //if it isn't, it changes the direction
            } else {
                [pathStack.top setObject: [NSString stringWithFormat:@"%ld,%ld",[topStringIndex integerValue], [topDirection integerValue] +1]];
            }
        }
        
        //going left
        if ([topDirection integerValue] == 3) {
            //checks if next node is valid
            if ((([topStringIndex integerValue])%self.textLength)-1 != -1 && [[self.mazeString substringWithRange:NSMakeRange([topStringIndex integerValue] -1, 1)] isEqualToString: @"#"] == false && [allVisitedNodes containsObject:[NSString stringWithFormat: @"%ld", [topStringIndex integerValue] -1]] == false) {
                nextObject = [NSString stringWithFormat:@"%ld,%i",[topStringIndex integerValue] -1, 1];
                [pathStack push:nextObject];
                [processStack push:nextObject];
                //if it isn't, it changes the direction
            } else {
                [pathStack.top setObject: [NSString stringWithFormat:@"%ld,%ld",[topStringIndex integerValue], [topDirection integerValue] +1]];
            }
        }
        
        //going up
        if ([topDirection integerValue] == 2) {
            //checks if next node is valid
            if (([topStringIndex integerValue] +1) - self.textLength > -1 && [[self.mazeString substringWithRange:NSMakeRange([topStringIndex integerValue] - self.textLength, 1)] isEqualToString: @"#"] == false && [allVisitedNodes containsObject:[NSString stringWithFormat: @"%ld", [topStringIndex integerValue] - self.textLength]] == false) {
                nextObject = [NSString stringWithFormat:@"%ld,%i",[topStringIndex integerValue] - self.textLength, 1];
                [pathStack push:nextObject];
                [processStack push:nextObject];
                //if it isn't, it changes the direction
            } else {
                [pathStack.top setObject: [NSString stringWithFormat:@"%ld,%ld",[topStringIndex integerValue], [topDirection integerValue] +1]];
            }
        }
        
        //going down
        if ([topDirection integerValue] == 4) {
            //checks if next node is valid
            if (([topStringIndex integerValue]+1) + self.textLength < self.mazeString.length && [[self.mazeString substringWithRange:NSMakeRange([topStringIndex integerValue] + self.textLength, 1)] isEqualToString: @"#"] == false && [allVisitedNodes containsObject:[NSString stringWithFormat: @"%ld", [topStringIndex integerValue] + self.textLength]] == false) {
                nextObject = [NSString stringWithFormat:@"%ld,%i",[topStringIndex integerValue] + self.textLength, 1];
                [pathStack push:nextObject];
                [processStack push:nextObject];
                //if it isn't, it changes the direction
            } else {
                [processStack push:[NSString stringWithFormat:@"%ld,%i",[topStringIndex integerValue], 5]];
                [pathStack pop];
            }
        }
        
        NSArray* topComponents = [pathStack.top.object componentsSeparatedByString:@","];
        topStringIndex = topComponents.firstObject;
        topDirection = topComponents.lastObject;
        
        if ([allVisitedNodes containsObject:topStringIndex] == false) {
        [allVisitedNodes addObject:topStringIndex];
        }
    }
    return processStack;
}





-(NSMutableArray*) solveTheMazeBreadth{
    Node* startNode = [[Node alloc]init];
    Queue* searchQueue = [[Queue alloc]init];
    NSString* nodeObject = [NSString stringWithFormat:@"%ld",self.startIndex];
    [startNode setObject: nodeObject];
    [searchQueue setTop: startNode];
    NSMutableArray* allVisitedNodes = [[NSMutableArray alloc]init];
    [allVisitedNodes addObject:nodeObject];
    NSMutableArray* allSquares = [[NSMutableArray alloc]init];
    NSString * poppedIndex;
    NSString * nextObject;
    
    while ([[NSString stringWithFormat: @"%ld", [poppedIndex integerValue] +1] isEqualToString: [NSString stringWithFormat:@"%ld",self.endIndex]] == false && [[NSString stringWithFormat: @"%ld", [poppedIndex integerValue] -1] isEqualToString: [NSString stringWithFormat:@"%ld",self.endIndex]] == false && [[NSString stringWithFormat: @"%ld", [poppedIndex integerValue] + self.textLength] isEqualToString: [NSString stringWithFormat:@"%ld",self.endIndex]] == false && [[NSString stringWithFormat: @"%ld", [poppedIndex integerValue] - self.textLength] isEqualToString: [NSString stringWithFormat:@"%ld",self.endIndex]] == false) { //while none of the next indexes are the end index
        
    poppedIndex = [searchQueue dequeue];
        
        //going right
        //checks if next node is valid
        if ((([poppedIndex integerValue] +1)%self.textLength)+1 != self.textLength && [[self.mazeString substringWithRange:NSMakeRange([poppedIndex integerValue] +1, 1)] isEqualToString: @"#"] == false && [allVisitedNodes containsObject:[NSString stringWithFormat: @"%ld", [poppedIndex integerValue] +1]] == false) {
            nextObject = [NSString stringWithFormat:@"%ld",[poppedIndex integerValue] +1];
            Square* newSquare = [[Square alloc]initWithSquareIndex:[NSString stringWithFormat: @"%ld", [poppedIndex integerValue] +1] andPreviousSquareIndex:[NSString stringWithFormat: @"%ld",[poppedIndex integerValue]]];
            [allVisitedNodes addObject: newSquare.squareIndex];
            [allSquares addObject:newSquare];
            [searchQueue enQueue:nextObject];
        }
    
        //going left
        //checks if next node is valid
        if ((([poppedIndex integerValue])%self.textLength)-1 != -1 && [[self.mazeString substringWithRange:NSMakeRange([poppedIndex integerValue] -1, 1)] isEqualToString: @"#"] == false && [allVisitedNodes containsObject:[NSString stringWithFormat: @"%ld", [poppedIndex integerValue] -1]] == false) {
            nextObject = [NSString stringWithFormat:@"%ld",[poppedIndex integerValue] -1];
            Square* newSquare = [[Square alloc]initWithSquareIndex:[NSString stringWithFormat: @"%ld",[poppedIndex integerValue] -1] andPreviousSquareIndex:[NSString stringWithFormat: @"%ld",[poppedIndex integerValue]]];
            [allVisitedNodes addObject: newSquare.squareIndex];
            [allSquares addObject:newSquare];
            [searchQueue enQueue:nextObject];
        }
    
        //going up
        //checks if next node is valid
        if (([poppedIndex integerValue] +1) - self.textLength > -1 && [[self.mazeString substringWithRange:NSMakeRange([poppedIndex integerValue] - self.textLength, 1)] isEqualToString: @"#"] == false && [allVisitedNodes containsObject:[NSString stringWithFormat: @"%ld", [poppedIndex integerValue] - self.textLength]] == false) {
            nextObject = [NSString stringWithFormat:@"%ld",[poppedIndex integerValue] - self.textLength];
            Square* newSquare = [[Square alloc]initWithSquareIndex:[NSString stringWithFormat: @"%ld",[poppedIndex integerValue] - self.textLength] andPreviousSquareIndex:[NSString stringWithFormat: @"%ld",[poppedIndex integerValue]]];
            [allVisitedNodes addObject: newSquare.squareIndex];
            [allSquares addObject:newSquare];
            [searchQueue enQueue:nextObject];
        }
    
        //going down
        //checks if next node is valid
        if (([poppedIndex integerValue]+1) + self.textLength < self.mazeString.length && [[self.mazeString substringWithRange:NSMakeRange([poppedIndex integerValue] + self.textLength, 1)] isEqualToString: @"#"] == false && [allVisitedNodes containsObject:[NSString stringWithFormat: @"%ld", [poppedIndex integerValue] + self.textLength]] == false) {
            nextObject = [NSString stringWithFormat:@"%ld",[poppedIndex integerValue] + self.textLength];
            Square* newSquare = [[Square alloc]initWithSquareIndex:[NSString stringWithFormat: @"%ld",[poppedIndex integerValue] + self.textLength] andPreviousSquareIndex:[NSString stringWithFormat: @"%ld",[poppedIndex integerValue]]];
            [allVisitedNodes addObject: newSquare.squareIndex];
            [allSquares addObject:newSquare];
            [searchQueue enQueue:nextObject];
        }
    
    }
    //add final square with previous square popped
     Square* newSquare = [[Square alloc]initWithSquareIndex:[NSString stringWithFormat: @"%ld", self.endIndex] andPreviousSquareIndex:[NSString stringWithFormat: @"%ld",[poppedIndex integerValue]]];
    
    [allSquares addObject:newSquare];
    return allSquares;
}
@end
