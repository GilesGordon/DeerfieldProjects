//
//  LLRB.h
//  LLRBTree
//
//  Created by nzucker22 on 5/10/21.
//  Copyright © 2021 nzucker22. All rights reserved.
//

#ifndef LLRB_h
#define LLRB_h
#import "Node.h"

@interface LLRB : NSObject

@property Node *root;

-(Node *) flipColor: (Node*) middleNode;
-(Node *) rotateRight: (Node*) rightmostNode;
-(Node *) rotateLeft: (Node*) leftMostNode;
-(Node*) fix: (Node*) currentNode;
-(void) insert: (int) key;
-(void) putLLRB: (int) key;
-(void) putBST: (int) key;

@end

#endif /* LLRB_h */
