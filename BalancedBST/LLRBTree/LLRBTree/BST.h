//
//  BST.h
//  Assignment 6
//
//  Created by nzucker22 on 4/29/21.
//  Copyright © 2021 nzucker22. All rights reserved.
//

#ifndef BST_h
#define BST_h
#import "Node.h"

@interface BST : NSObject

@property Node *root;

-(instancetype) init;

-(BOOL) containsWrapper:(int) key;

-(BOOL) contains:(Node *) thisNode :(int) key;
   // Does this symbol table contain the given key?

-(Node *) delete:(int) key :(Node *)root;   // Removes the specified key and its associated value from this symbol table (if the key is in this symbol table).

-(int) height:(Node *)thisNode;  // Returns the height of the BST (for debugging)

-(BOOL) isEmpty;    // Returns true if this symbol table is empty.

-(void) main: (int *) args;   // Unit tests the BST data type

-(int) maxWrapper;   // Returns the largest key in the symbol table.

-(int) minWrapper;   // Returns the smallest key in the symbol table.

-(void) levelOrderWrapper;   // traverse (prints out) the keys as levels, left to right.

-(void) inOrderWrapper;   // traverse (prints out) the keys in inorder order.

-(void) postOrderWrapper;   // traverses (prints out) the keys in postorder order.

-(void) preOrderWrapper;    // traverses (prints out) the keys in preorder order

-(void) put:(int) key;   // Inserts the specified key-value pair into the symbol table, overwriting the old value with the new value if the symbol table already contains the specified key.

-(int) sizeWrapper;    // Returns the number of key-value pairs in this symbol table

@end

#endif /* BST_h */
