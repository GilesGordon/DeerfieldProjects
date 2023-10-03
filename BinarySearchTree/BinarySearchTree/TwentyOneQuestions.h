//
//  TwentyOneQuestions.h
//  BinarySearchTree
//
//  Created by ggordon22 on 5/9/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef TwentyOneQuestions_h
#define TwentyOneQuestions_h
#import "BinarySearchTree.h"

@interface TwentyOneQuestions: NSObject
@property NSString *path;
@property BinarySearchTree *questionTree;
@property NSArray *textArray;
@property int gamesWon;
@property int gamesLost;

@end
#endif /* TwentyOneQuestions_h */
