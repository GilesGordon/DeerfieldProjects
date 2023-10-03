//
//  Node.h
//  LLRBTree
//
//  Created by nzucker22 on 5/10/21.
//  Copyright © 2021 nzucker22. All rights reserved.
//

#ifndef Node_h
#define Node_h

@interface Node : NSObject
@property Node *left;
@property Node *right;
@property BOOL red;
@property int key;
//true if link to parent is red

- (instancetype)init;
- (instancetype)initWithKey: (int) key;

@end

#endif /* Node_h */
