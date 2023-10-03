//
//  ViewController.m
//  BinarySearchTree
//
//  Created by ggordon22 on 4/30/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
{
    //variables
    TwentyOneQuestions *player;
    NSArray *arr;
    NSArray *tempArr;
    BinarySearchTree *tree;
    BinarySearchTree *tempTree;
    Node *root;
    Node *currentNode;
    Node *newObjectNode1;
    Node *newObjectNode2;
    Node *tempNode;
    NSFileManager *filemgr;
    NSString *logString;
    NSString *textFileContent;
    NSString *newObject;
    NSString *newObjectQuestion;
    NSString *newObjectAnswer;
    NSString *content;
    int action;
    int numberOfQuestions;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    action = 0;
    [self setUpTextFile];
    [self setUpTwentyOneQuestions];
    logString =  @"Welcome to CS 106X 21 Questions!\nThink of an item, and I will guess it\nusing a series of yes-or-no questions.\nI can also learn and grow smarter over time.\nShall I recall my previous memory state? (y/n)";
    [_log setString:logString];
    
   
//    NSString* content;
//    content = [NSString stringWithContentsOfFile:player.path encoding:NSUTF8StringEncoding error:NULL];
//    NSLog(@"%@", content);
}

- (void) setUpTextFile { //put in class?
    filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath:@"path"] == NO)
        [[NSFileManager defaultManager] createFileAtPath:@"path" contents:nil attributes:nil];
}

- (void) setUpTwentyOneQuestions {
    player = [[TwentyOneQuestions alloc] init];
    [player setGamesWon: 0];
    [player setGamesLost: 0];
    arr = [[NSArray alloc]init];
    tree = [[BinarySearchTree alloc]init];
    tempTree = [[BinarySearchTree alloc]init];
    root = [[Node alloc]init];
    [root setKey: 2097152]; //2 to the power of 21
    [root setValue: @"dog"];
    currentNode = root;
    [tree setRoot: root];
    [player setTextArray:arr];
    [player setQuestionTree:tree];
    [player setPath: @"path"];
}

//Whenever the input button is pressed, the program sees which type of reponse it's supposed to get based on which "action" it is currently at. Whenever it recieves a valid input, it does whatever is written and then switches the action to the next type of input.
- (IBAction)inputButtonPressed:(id)sender {
    if (action == 0){//choose to load old data (only at start)
        if ([[[self input] stringValue] isEqualToString:@"y"]) {
            textFileContent = [NSString stringWithContentsOfFile:[player path] encoding:NSUTF8StringEncoding error:NULL];
            [player setTextArray: [textFileContent componentsSeparatedByString:@"\n"]];
            [root setKey: 2097152];
            [root setValue:[player textArray][0]];
            [[player questionTree] setRoot:root];
            for (int i=2; i<[player textArray].count -1; i+=2){
                  [[player questionTree] put:(int)[[player textArray][i+1] integerValue] withValue:[NSString stringWithFormat: @"%@", [player textArray][i]]];//puts the item in the text file into the list
            }
        }
        if ([[[self input] stringValue] isEqualToString:@"y"] || [[[self input] stringValue] isEqualToString:@"n"]) {
            [self switchToActionOne];
        }
    }else if (action == 1){ //user options
        numberOfQuestions = 0;
        if ([[[self input] stringValue] isEqualToString:@"p"]) {
            [self chooseFiveOrSix];
        } else if ([[[self input] stringValue] isEqualToString:@"s"]) {
            logString = [NSString stringWithFormat:@"%@\n\nI've won %i game(s)\nYou've won %i game(s)", logString,[player gamesWon] ,[player gamesLost]];
            [_log setString: logString];
            [self switchToActionOne];
        } else if ([[[self input] stringValue] isEqualToString:@"q"]) {
            action = -1;
            [self levelorder]; //save tree to file
            logString =  [NSString stringWithFormat:@"%@\n\nThe data has been stored.\nThanks for playing!", logString];
            [_log setString:logString];
            
        }
    }else if (action == 2){ //responded to "What was the object?"
        newObject =[[self input] stringValue];
        if (numberOfQuestions < 21) {
            [self switchToActionSeven];
        }else {
            logString = [NSString stringWithFormat:@"%@\nI cannot enter any more questions in this path", logString];
            [_log setString: logString];
            [self switchToActionOne];
            }
    }else if (action == 5){ //responded to guessed answer
         if ([[[self input] stringValue] isEqualToString:@"y"]) {
             logString = [NSString stringWithFormat:@"%@\nYay, I won!", logString];
             [_log setString: logString];
             [player setGamesWon: [player gamesWon] + 1];
             [self switchToActionOne];
         } else if ([[[self input] stringValue] isEqualToString:@"n"]) {
             logString = [NSString stringWithFormat:@"%@\nDrat, I lost! What was the object?", logString];
             [_log setString: logString];
             [player setGamesLost: [player gamesLost] + 1];
             action = 2;
         }
    }else if (action == 6){ //responded to guessed question
        if ([[[self input] stringValue] isEqualToString:@"y"]) {
            currentNode = currentNode.right;
            [self chooseFiveOrSix];
        } else if ([[[self input] stringValue] isEqualToString:@"n"]) {
            currentNode = currentNode.left;
            [self chooseFiveOrSix];
        }
    } else if (action == 7) { //responded to "Type a Y/N question to distinguish object from object"
        if ([[[self input] stringValue] containsString:@"?"] == true) {
        newObjectQuestion = [[self input] stringValue];
        [self switchToActionEight];
        }
    } else if (action == 8) {//responded to "And what is the answer for _ " Makes two nodes, replaces the old leaf with the new question and the old leaf becomes the leaf farther down along with another alternative object to the other direction
//        int num = 1;
//        tempNode = [player questionTree].root;
//        while (tempNode.)
        if ([[[self input] stringValue] isEqualToString:@"y"]) {
            [self createNewNodes];
            [newObjectNode1 setValue: currentNode.value];
            [newObjectNode2 setValue: newObject];
            [currentNode setValue: newObjectQuestion];
            [self switchToActionOne];
        } else if ([[[self input] stringValue] isEqualToString:@"n"]) {
            [self createNewNodes];
            [newObjectNode2 setValue: currentNode.value];
            [newObjectNode1 setValue: newObject];
            [currentNode setValue: newObjectQuestion];
            [self switchToActionOne];
        }
    }
}

//levelorder and saveLevelAtLevel save each key and value pair for every node in the tree to the text file in level order. This way, as long as their keys are in the right order, adding the nodes back onto the tree will be much easier.

-(void) levelorder{
        NSString *str = [NSString stringWithFormat: @"%@\n%i",[NSString stringWithFormat:@"%@", [player questionTree].root.value],2097152];
        [str writeToFile:[player path] atomically:YES encoding:NSUTF8StringEncoding error:nil]; //root is edge case because there is no "previous key"
    for (int i = 2; i< [player questionTree].height+1; i++){
        [self saveLevelAtLevel: i withCurrentNode: [player questionTree].root withOriginalLevel:i withPreviousKey:2097152 fromDirection: -1];
    }
}

-(void) saveLevelAtLevel: (int) level withCurrentNode: (Node*) currentNode withOriginalLevel: (int) originalLevel withPreviousKey: (int) previousKey fromDirection: (int) direction {
    if (currentNode == nil) {
        return;
    }
    if (level == 1) {
        int newKey = (previousKey/pow(2, originalLevel - 1))*direction + previousKey;
        [currentNode setKey: newKey];
        content = [NSString stringWithContentsOfFile:[player path] encoding:NSUTF8StringEncoding error:NULL];
        NSString *str = [NSString stringWithFormat: @"%@\n%@\n%i", content, [NSString stringWithFormat:@"%@", currentNode.value], newKey];
        [str writeToFile:[player path] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    } else if (level > 1) {
        [self saveLevelAtLevel: level - 1 withCurrentNode: currentNode.left withOriginalLevel: originalLevel withPreviousKey: currentNode.key fromDirection: -1];
        [self saveLevelAtLevel: level - 1 withCurrentNode: currentNode.right withOriginalLevel: originalLevel withPreviousKey: currentNode.key fromDirection: 1];
    }
}

- (void) createNewNodes {
    newObjectNode1 = [[Node alloc]init];
    newObjectNode2 = [[Node alloc]init];
    [currentNode setRight:newObjectNode2];
    [currentNode setLeft:newObjectNode1];
}

- (void) chooseFiveOrSix{
    if (currentNode.left == nil && currentNode.right == nil) {
        [self switchToActionFive];
    } else {
        [self switchToActionSix];
    }
}

- (void) switchToActionOne {
    currentNode = root;
    action = 1;
    logString = [NSString stringWithFormat:@"%@\n\nP)lay, S)tats, Q)uit? (p/s/q)", logString];
    [_log setString: logString];
}

- (void) switchToActionFive {
    logString = [NSString stringWithFormat:@"%@\nAre you thinking of: %@? (y/n)", logString, [NSString stringWithFormat:@"%@", currentNode.value]];
    [_log setString: logString];
    numberOfQuestions++;
    action = 5;
}

- (void) switchToActionSix {
    logString = [NSString stringWithFormat:@"%@\n%@ (y/n)", logString, [NSString stringWithFormat:@"%@", currentNode.value]];
    [_log setString: logString];
    action = 6;
}

- (void) switchToActionSeven {
    logString = [NSString stringWithFormat:@"%@\nType a Y/N question to distinguish %@ from %@ (must contain a '?')", logString, [NSString stringWithFormat:@"%@", currentNode.value], newObject];
    [_log setString: logString];
    action = 7;
}

- (void) switchToActionEight {
    logString = [NSString stringWithFormat:@"%@\nAnd what is the answer for %@?", logString, newObject];
    [_log setString: logString];
    action = 8;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}



@end
