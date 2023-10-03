//
//  BinarySearchTree.m
//  BinarySearchTree
//
//  Created by ggordon22 on 4/30/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinarySearchTree.h"

@implementation BinarySearchTree

-(BOOL) contains: (int) key{
    Node *currentNode = self.root;
    while (currentNode != nil) {
        if (currentNode.key == key) {
            return true;
        } else if (key > currentNode.key) {
            currentNode = currentNode.right;
        } else {
            currentNode = currentNode.left;
        }
    }
    return false;
}

-(void) remove: (int) key{
    Node* minNode = [[Node alloc] init];
    if (self.root.key == key) {
        [self setRoot: [self deleteNode:self.root withMinNode: minNode]];
    }
    [self removeRecursionAtKey: key withNode: self.root andMinNode: minNode];
}

-(void) removeRecursionAtKey: (int) key withNode: (Node*) currentNode andMinNode: (Node*) minNode{
    if (currentNode.right.key == key) {
        [currentNode setRight: [self deleteNode:currentNode.right withMinNode:minNode]];
    } else if (currentNode.left.key == key) {
        [currentNode setLeft: [self deleteNode:currentNode.left withMinNode:minNode]];
    } else if (currentNode.left == nil && currentNode.right == nil) { //ends the recursion if the key isn't found on a path
        return;
    } else { //goes down the tree and keeps looking for the key to be deleted
        if (key > currentNode.key) { //speeds up method be not making unneeded calls
            [self removeRecursionAtKey: key withNode: currentNode.right andMinNode: minNode];
        } else {
            [self removeRecursionAtKey: key withNode: currentNode.left andMinNode: minNode];
        }
    }
}

-(Node*) deleteNode: (Node*) currentNode withMinNode: (Node*) minNode{
    if (currentNode.right != nil) {
        if (currentNode.left != nil) { //if there is a node to the right of the node to be deleted, checks if there is a node to the left of the node to be deleted. If so, sets that left node to be the left of the smallest node in the tree with a root as the right node of the node being deleted
            minNode = currentNode.right;
            minNode = [self minOfNodeTree:minNode]; //gets smallest key in the tree with min node as the root
            [minNode setLeft: currentNode.left];
        }
        return currentNode.right;
    } else if (currentNode.left != nil) { //if there is only a node to the left of the deleted node, the left node replaces the deleted node.
        return currentNode.left;
    } else {
        return nil;
    }
}

-(Node*) minOfNodeTree: (Node*) root{
    while (root.left != nil) {
        root = root.left;
    }
    return root;
}

-(int) height{
    return [self heightAtNode: self.root];
}

-(int) heightAtNode: (Node*) currentNode{
    if (currentNode == nil) {
        return 0;
    } else {
        int heightOfLeft = [self heightAtNode: currentNode.left];
        int heightOfRight = [self heightAtNode: currentNode.right];
        if (heightOfLeft > heightOfRight) {
            return heightOfLeft + 1;
        } else {
            return heightOfRight + 1;
        }
    }
}

-(BOOL) isEmpty{
    if (self.root == nil) {
        return true;
    }
    return false;
}

-(int) max{
    Node* currentNode = self.root;
    while (currentNode.right != nil) {
        currentNode = currentNode.right;
    }
    return currentNode.key;
}

-(int) min{
    Node* currentNode = self.root;
    while (currentNode.left != nil) {
        currentNode = currentNode.left;
    }
    return currentNode.key;
}

-(void) levelorder{
    for (int i = 1; i< self.height+1; i++){
        [self printLevelAtLevel: i withCurrentNode: self.root];
    }
}

-(void) printLevelAtLevel: (int) level withCurrentNode: (Node*) currentNode {
    if (currentNode == nil) {
        return;
    }
    if (level == 1) {
    NSLog(@"%@", currentNode.value);
    } else if (level > 1) {
        [self printLevelAtLevel: level - 1 withCurrentNode: currentNode.left];
        [self printLevelAtLevel: level - 1 withCurrentNode: currentNode.right];
    }
}

-(void) inorder{
    [self printInorderAtNode: self.root];
}

-(void) printInorderAtNode: (Node*) currentNode{
    if (currentNode == nil) {
        return;
    } else {
        [self printInorderAtNode: currentNode.left];
        NSLog(@"%@", currentNode.value);
        [self printInorderAtNode: currentNode.right];
    }
}

-(void) postorder{
    [self printPostorderAtNode: self.root];
}

-(void) printPostorderAtNode: (Node*) currentNode{
    if (currentNode == nil) {
        return;
    } else {
        [self printPostorderAtNode: currentNode.left];
        [self printPostorderAtNode: currentNode.right];
        NSLog(@"%@", currentNode.value);
    }
}

-(void) preorder{
    [self printPreorderAtNode: self.root];
}

-(void) printPreorderAtNode: (Node*) currentNode{
    if (currentNode == nil) {
        return;
    } else {
        NSLog(@"%@", currentNode.value);
        [self printPreorderAtNode: currentNode.left];
        [self printPreorderAtNode: currentNode.right];
    }
}

-(void) put:(int) key withValue: (id) val {
    Node *currentNode = self.root;
    while(((key > currentNode.key && currentNode.right != nil) || (key < currentNode.key && currentNode.left != nil)) && currentNode.key != key){ //while the next node isn't nil and the key isn't a duplicate
        if (key > currentNode.key) {
            currentNode = currentNode.right;
        } else {
            currentNode = currentNode.left;
        }
    }
    if (currentNode.key == key) {
        [currentNode setValue: val];
    } else {
        Node *newNode = [[Node alloc] init];
        [newNode setKey: key];
        [newNode setValue: val];
        if (self.root == nil) {
            [self setRoot: newNode];
        } else if (key > currentNode.key) {
            [currentNode setRight: newNode];
        } else {
            [currentNode setLeft: newNode];
        }
    }
}

-(int) size{
    return [self sizeRecursionAtNode: self.root];
}

-(int) sizeRecursionAtNode: (Node*) currentNode {
    if (currentNode == nil) {
        return 0;
    } else {
        return 1 + [self sizeRecursionAtNode: currentNode.left] + [self sizeRecursionAtNode: currentNode.right];
    }
}

@end
