//
//  GameScene.m
//  MapRouting
//
//  Created by ggordon22 on 5/24/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import "GameScene.h"

//PLEASE READ MR. BAKKER
//to select the two cities, change the "start" and "end" variables
@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
    Map *map;
    NSArray *mapData;
}

- (void)didMoveToView:(SKView *)view {
    [self textToMap];
    [self createMap];
    PathNode * testResultNode = [[PathNode alloc]init];
    //start and end cities
    int start = 1234;
    int end = 82000;
    City *tempCity;
    testResultNode = [map DijsktraAlgorithmWithStart:start andEnd:end];
    
    int x;
    int y;
    int toX;
    int toY;
    while (testResultNode.previousPathNode != nil) { //finds the path by going back all the previous nodes of the result node
    //scales the coordinates of the city and previous city and draws a line through them
        NSLog(@"%i",testResultNode.currentCity);
        tempCity = (City *)map.listOfCities[testResultNode.currentCity];
        x = tempCity.x/(10000/self.size.width) - (self.size.width/2);
        y = tempCity.y/(5000/self.size.height) - (self.size.height/2);

        testResultNode = testResultNode.previousPathNode;
        tempCity = (City *)map.listOfCities[testResultNode.currentCity];
        toX = tempCity.x/(10000/self.size.width) - (self.size.width/2);
        toY = tempCity.y/(5000/self.size.height) - (self.size.height/2);
        [self makeLine:x :y :toX :toY];
    }
    NSLog(@"%i",testResultNode.currentCity);
    NSLog(@"scrolling up will give the order from start to finish of the shortest path");
    
}

- (void)textToMap {
    [self readTextAndFirstLine];
    [self makeCities];
    [self setConnections];
}

- (void) readTextAndFirstLine {
    map = [[Map alloc]init];
    map.listOfCities = [[NSMutableArray alloc]init];
    map.citiesWithShortestDistance = [[NSMutableArray alloc]init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"usa" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL]; //reads the text file
    mapData = [content componentsSeparatedByString:@"\n"]; //array of file lines
    NSArray *stats = [mapData[0] componentsSeparatedByString:@" "]; //# of cities and connections
    [map setNumberOfCities:(int)[stats[0] integerValue]];
    [map setNumberOfConnections:(int)[stats[1] integerValue]];
}

- (void) makeCities {
    for (int i = 0; i < map.numberOfCities; i++) { //makes a city with coordinates and adds to the map's "listOfCities"
        NSArray *currentCoordinates = [mapData[i+1] componentsSeparatedByString:@" "];
        NSMutableArray *currentCoordinatesWithoutSpaces = [[NSMutableArray alloc]init];
        for (int i = 0; i<[currentCoordinates count]; i++) {
            if ([currentCoordinates[i] isEqualToString:@""] == false) {
                [currentCoordinatesWithoutSpaces addObject:currentCoordinates[i]];
            }
        }
        City *newCity = [[City alloc]init];
        newCity.x = (int)[currentCoordinatesWithoutSpaces[1] integerValue];
        newCity.y = (int)[currentCoordinatesWithoutSpaces[2] integerValue];
        [map.listOfCities addObject:newCity];
        [map.citiesWithShortestDistance addObject:@""];
    }
}
- (void) setConnections {
    for (int i = 0; i < map.numberOfConnections; i++) { //sets the connections of all the cities to each other
        NSArray *currentConnection = [mapData[i + map.numberOfCities + 2] componentsSeparatedByString:@" "];
        NSMutableArray *connectionsWithoutSpaces = [[NSMutableArray alloc]init];
        for (int j = 0; j<[currentConnection count]; j++) {
            if ([currentConnection[j] isEqualToString:@""] == false) {
                [connectionsWithoutSpaces addObject:currentConnection[j]];
            }
        }
        City *currentCity = map.listOfCities[[connectionsWithoutSpaces[0] integerValue]];
        [currentCity.connections addObject:[NSString stringWithFormat: @"%ld",[connectionsWithoutSpaces[1] integerValue]]];
        currentCity.numberOfCityConnections ++;
        currentCity = map.listOfCities[[connectionsWithoutSpaces[1] integerValue]];
        [currentCity.connections addObject:[NSString stringWithFormat: @"%ld",[connectionsWithoutSpaces[0] integerValue]]];
        currentCity.numberOfCityConnections ++;
        
    }
}

- (void) createMap {
//    let background = SKSpriteNode(imageNamed: "background.jpg");
//    background.position = CGPoint(x: size.width/2, y: size.height/2);
//    addChild(background);
    
//    SKLabelNode *label = [SKLabelNode labelNodeWithText:@"firstCityIndex:"];
//    label.position = CGPointMake(self.size.width-400, self.size.height-200);
//    [self addChild: label];
//    SKLabelNode *label2 = [SKLabelNode labelNodeWithText:@"secondCityIndex:"];
//    label2.position = CGPointMake(self.size.width-400, self.size.height-230);
//    [self addChild: label2];
    
//    NSTextField *textField = [[NSTextField alloc]
//                              initWithFrame:CGRectMake(self.size.width-280, self.size.height-200, 70, 20)];
//    NSTextField *textField2 = [[NSTextField alloc]
//                              initWithFrame:CGRectMake(self.size.width-280, self.size.height-230, 70, 20)];
//    [self.view addSubview:textField];
//    [self.view addSubview:textField2];
    for (int i = 0; i < map.numberOfCities; i+=5) {
        SKShapeNode * newNode = [SKShapeNode shapeNodeWithCircleOfRadius: .2];
        newNode.position = CGPointMake(((City *)map.listOfCities[i]).x/(10000/self.size.width) - (self.size.width/2), ((City *)map.listOfCities[i]).y/(5000/self.size.height) - (self.size.height/2));
        [self addChild: newNode];
    }
}

-(void) makeLine: (int) x :(int) y :(int) toX :(int) toY{
    SKShapeNode *line = [SKShapeNode node];
    CGMutablePathRef pathToDraw = CGPathCreateMutable();
    CGPathMoveToPoint(pathToDraw, NULL, x, y);
    CGPathAddLineToPoint(pathToDraw, NULL, toX, toY);
    line.path = pathToDraw;
    [line setName:@"LINE"];
    [line setStrokeColor:[SKColor redColor]];
    [self addChild:line];
}

- (void)touchDownAtPoint:(CGPoint)pos {
//    SKShapeNode *n = [_spinnyNode copy];
//    n.position = pos;
//    n.strokeColor = [SKColor greenColor];
//    [self addChild:n];
}

- (void)mouseDown:(NSEvent *)theEvent {
//    [self touchDownAtPoint:[theEvent locationInNode:self]];
}


@end
