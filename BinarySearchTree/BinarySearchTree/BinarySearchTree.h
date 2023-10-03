//
//  BinarySearchTree.h
//  BinarySearchTree
//
//  Created by ggordon22 on 4/30/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef BinarySearchTree_h
#define BinarySearchTree_h
#import "Node.h"

@interface BinarySearchTree: NSObject

@property Node *root;

-(BOOL) contains: (int) key;   // Does this symbol table contain the given key?

-(void) remove: (int) key;   // Removes the specified key and its associated value from this symbol table (if the key is in this symbol table).

-(int) height;  // Returns the height of the BST (for debugging)

-(BOOL) isEmpty;    // Returns true if this symbol table is empty.

//-(void) main:(String[]) args;   // Unit tests the BST data type

-(int) max;   // Returns the largest key in the symbol table.

-(int) min;   // Returns the smallest key in the symbol table.

-(void) levelorder;   // traverse (prints out) the keys as levels, left to right.

-(void) inorder;   // traverse (prints out) the keys in inorder order.

-(void) postorder;    // traverses (prints out) the keys in postorder order.

-(void) preorder;     // traverses (prints out) the keys in preorder order

-(void) put:(int) key withValue: (id) val;    // Inserts the specified key-value pair into the symbol table, overwriting the old value with the new value if the symbol table already contains the specified key.

-(int) size;    // Returns the number of key-value pairs in this symbol table.


@end

#endif /* BinarySearchTree_h */
