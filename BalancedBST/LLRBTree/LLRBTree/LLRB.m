//
//  LLRB.m
//  LLRBTree
//
//  Created by nzucker22 on 5/10/21.
//  Copyright © 2021 nzucker22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLRB.h"

@implementation LLRB

-(Node *) flipColor: (Node*) middleNode {
    middleNode.red = true;
    middleNode.right.red = false;
    middleNode.left.red = false;
    return middleNode;
}

-(Node *) rotateRight: (Node*) rightmostNode{
    Node *middleNode = rightmostNode.left;
    rightmostNode.left = middleNode.right;
//    moves little branch
    middleNode.right = rightmostNode;
    return middleNode;
//    middleNode is connected to rest of tree above itself (where rightMostNode was before rotation)
}

-(Node *) rotateLeft: (Node*) leftMostNode{
    Node *bottomNode = leftMostNode.right;
    leftMostNode.right = bottomNode.left;
//    moves little branch
    bottomNode.left = leftMostNode;
    return bottomNode;
}

-(void) insert: (int) key{
    Node *nodeToInsert = [[Node alloc]initWithKey:key];
    if(self.root==nil){
        self.root = nodeToInsert;
    }
    else{
        Node *temp = self.root;
        while(true){
            if(key > temp.key){
                if(temp.right!=nil){
                    temp = temp.right;
                }
                else{
//                  insert here
                    break;
                }
            }
            else if(key < temp.key){
                if(temp.left!=nil){
                    temp = temp.left;
                }
                else{
//                  insert here
                    break;
                }
            }
            else if(key==temp.key){
//                temp = nodeToPut;
            }
        }
    }
}

-(void) putBST: (int) key{
    if(self.root==nil){
        self.root = [[Node alloc]initWithKey: key];
    }
    else{
        self.root = [self putRecursiveWithoutFix:key withCurrentNode:self.root];
    }
}

-(Node*) putRecursiveWithoutFix: (int) key withCurrentNode: (Node*) currentNode{
    if (currentNode == nil) {
        Node *newNode = [[Node alloc]initWithKey: key];
        return newNode;
    }
    if (key > currentNode.key) {
        currentNode.right = [self putRecursiveWithoutFix:key withCurrentNode: currentNode.right];
    }
    if (key < currentNode.key) {
        currentNode.left = [self putRecursiveWithoutFix:key withCurrentNode: currentNode.left];
    }
    return currentNode;
}

-(void) putLLRB: (int) key{
    if(self.root==nil){
        self.root = [[Node alloc]initWithKey: key];
    }
    else{
        self.root = [self putRecursive:key withCurrentNode:self.root];
    }
}

-(Node*) putRecursive: (int) key withCurrentNode: (Node*) currentNode{
    if (currentNode == nil) {
        Node *newNode = [[Node alloc]initWithKey: key];
        newNode.red = true;
        return newNode;
    }
    if (key > currentNode.key) {
        currentNode.right = [self putRecursive:key withCurrentNode: currentNode.right];
    }
    if (key < currentNode.key) {
        currentNode.left = [self putRecursive:key withCurrentNode: currentNode.left];
    }
    currentNode = [self fix:currentNode];
    return currentNode;
}

-(Node*) fix: (Node*) currentNode {
    if (currentNode.left.red && currentNode.right.red) {
        return [self flipColor:currentNode];
    }
    if (currentNode.right.red) {
        currentNode = [self rotateLeft:currentNode];
    }
    if (currentNode.left.red && currentNode.left.left.red) {
        currentNode = [self rotateRight:currentNode];
    }
    if (currentNode.left.red && currentNode.right.red) {
        currentNode = [self flipColor:currentNode];
    }
    return currentNode;
}

@end
