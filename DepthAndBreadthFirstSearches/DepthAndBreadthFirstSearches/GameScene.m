//
//  GameScene.m
//  DepthAndBreadthFirstSearches
//
//  Created by ggordon22 on 4/15/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import "GameScene.h"
//When running this program, hold down "D" for depth search and "B" for breadth search. continuing to hold down "B" after it finishes showing the process will show the direct route.

@implementation GameScene {
    //declare variables
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
    MazeSolver* solver;
    NSInteger blockWidth;
    NSInteger blockHeight;
    NSInteger textLength;
    NSInteger textHeight;
    Stack* solvedMaze;
    Stack* solvedBreadth;
    NSArray*allSquaresFromBreadth;
    int counter;
    int mapChosen;
    NSString* path;
    
}

- (void)didMoveToView:(SKView *)view {
    mapChosen = 0;
    counter = 0;
    self.backgroundColor = [NSColor colorWithCalibratedRed:0 green:0 blue:0 alpha:1.0f];
    
//    map select: please leave the desired map uncommented
    
//    path = [[NSBundle mainBundle] pathForResource:@"smallMaze" ofType:@"txt"];
    path = [[NSBundle mainBundle] pathForResource:@"mediumMaze" ofType:@"txt"];
//    path = [[NSBundle mainBundle] pathForResource:@"largeMaze" ofType:@"txt"];


    NSString* content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    solver = [[MazeSolver alloc]init];
    [solver setMazeString: content];
    textLength = 0;
    textHeight = 0;
    while ([[content substringWithRange:NSMakeRange(textLength, 1)] isEqualToString: @"\n"] == false){
        textLength++;
    }
    [solver setTextLength:(textLength+1)];
    textHeight = ([content length]-1)/textLength;
    
    //background block demensions
    blockWidth = (self.size.width-250)/textLength;
    blockHeight = (self.size.height-250)/textLength;
    
    for (int i = 0; i < textLength; i++){
        for (int j = 0; j < textHeight; j++){
            //I added blocks only for the walls, start, and finish, because I thought it looked nicer. textLength is +1 because of the line breaks.
            SKShapeNode *wallNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(blockWidth,blockHeight)];
            wallNode.position = CGPointMake(blockWidth*i - self.size.width/2 +50 + blockWidth/2, self.size.height/2 -50 -blockHeight*j - blockHeight/2); //
            if ([[content substringWithRange:NSMakeRange(j*(textLength+1) + i, 1)] isEqualToString: @"#"] == true) {
                [wallNode setFillColor:[NSColor colorWithCalibratedRed:250 green:0 blue:0 alpha:1.0f]];
                [self addChild: wallNode];
            }
            if ([[content substringWithRange:NSMakeRange(j*(textLength+1) + i, 1)] isEqualToString: @"S"] == true) {
                [solver setStartIndex:(j*(textLength+1) + i)];
                [wallNode setFillColor:[NSColor colorWithCalibratedRed:0 green:250 blue:0 alpha:1.0f]];
                [self addChild: wallNode];
            }
            if ([[content substringWithRange:NSMakeRange(j*(textLength+1) + i, 1)] isEqualToString: @"G"] == true) {
                [solver setEndIndex:(j*(textLength+1) + i)];
                [wallNode setFillColor:[NSColor colorWithCalibratedRed:0 green:0 blue:250 alpha:1.0f]];
                [self addChild: wallNode];
            }
        }
    }
   // Depth Search Solver
    Stack*solvedMazeReversed = [[Stack alloc]init];
    solvedMaze = [[Stack alloc]init];
    solvedMazeReversed = [solver solveTheMazeDepth];
    int reversedMazeSize = [solvedMazeReversed size];
    for (int i = 0; i< reversedMazeSize; i++) {
        [solvedMaze push: [solvedMazeReversed pop].object];
    }
    [solvedMaze pop];
    
    
    // Breadth Search Solver
    solvedBreadth = [[Stack alloc]init];
    allSquaresFromBreadth = [solver solveTheMazeBreadth];
    Square* lastSquare =[allSquaresFromBreadth objectAtIndex: [allSquaresFromBreadth count] -1];
    NSInteger nextIndex;
    nextIndex = [lastSquare.previousSquareIndex integerValue];
    [solvedBreadth push:lastSquare.previousSquareIndex];
    while (nextIndex != solver.startIndex) {
        for (int i = 0; i< [allSquaresFromBreadth count]; i++) {
            Square* currentSquare = [allSquaresFromBreadth objectAtIndex:i];
            if([currentSquare.squareIndex integerValue] == nextIndex) {
                [solvedBreadth push:currentSquare.previousSquareIndex];
                nextIndex = [currentSquare.previousSquareIndex integerValue];
            }
        }
    }
    [solvedBreadth pop];
}

- (void)mouseDown:(NSEvent *)theEvent {

}

- (void)mouseDragged:(NSEvent *)theEvent {
    
}
- (void)mouseUp:(NSEvent *)theEvent {
    
}
- (void)touchDownAtPoint:(CGPoint)pos {

}

- (void)touchMovedToPoint:(CGPoint)pos {

}

- (void)touchUpAtPoint:(CGPoint)pos {

}

- (void)keyDown:(NSEvent *)theEvent {
    
    
    //depth search node adder
    if([theEvent.characters isEqualToString: @"d"]) {
        SKShapeNode *pathNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(blockWidth,blockHeight)];
        NSArray* topComponents = [solvedMaze.top.object componentsSeparatedByString:@","];
        [solvedMaze pop];
        NSString* stringIndex = topComponents.firstObject;
        NSString* deleteCheck = topComponents.lastObject;
        NSInteger indexInt = [stringIndex integerValue];
        
        pathNode.position = CGPointMake(blockWidth*(indexInt%(textLength+1)) - self.size.width/2 +50 + blockWidth/2, self.size.height/2 -50 -blockHeight*(indexInt/(textLength+1)) - blockHeight/2); //
        if ([deleteCheck integerValue]==5) {
            [pathNode setFillColor:[NSColor colorWithCalibratedRed:0 green:0 blue:0 alpha:1.0f]];
            [pathNode setLineWidth:0];
        } else {
            [pathNode setFillColor:[NSColor colorWithCalibratedRed:250 green:0 blue:250 alpha:1.0f]];
        }
        if ([solvedMaze size] > 0) {
            [self addChild: pathNode];
        }
    }
    
    //breadth search node adder
    if([theEvent.characters isEqualToString: @"b"]) {
        if (counter < [allSquaresFromBreadth count]-2) {
        SKShapeNode *pathNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(blockWidth,blockHeight)];
        Square*currentSquare = [allSquaresFromBreadth objectAtIndex:counter];
        NSInteger indexInt = [currentSquare.squareIndex integerValue];
        pathNode.position = CGPointMake(blockWidth*(indexInt%(textLength+1)) - self.size.width/2 +50 + blockWidth/2, self.size.height/2 -50 -blockHeight*(indexInt/(textLength+1)) - blockHeight/2);
        [pathNode setFillColor:[NSColor colorWithCalibratedRed:255 green:255 blue:0 alpha:1.0f]];
        [self addChild: pathNode];
        counter++;
        } else if ([solvedBreadth size] != 0){ //Starts drawing the straight path when breadth search is finished
            SKShapeNode *pathNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(blockWidth,blockHeight)];
            NSInteger indexInt = [[solvedBreadth pop].object integerValue];
            pathNode.position = CGPointMake(blockWidth*(indexInt%(textLength+1)) - self.size.width/2 +50 + blockWidth/2, self.size.height/2 -50 -blockHeight*(indexInt/(textLength+1)) - blockHeight/2);
            [pathNode setFillColor:[NSColor colorWithCalibratedRed:0 green:255 blue:255 alpha:1.0f]];
            [self addChild: pathNode];
        }
    }
}

//- (void)keyDown:(NSEvent *)theEvent {
//
//}


-(void)update:(CFTimeInterval)currentTime {
    
}

@end
