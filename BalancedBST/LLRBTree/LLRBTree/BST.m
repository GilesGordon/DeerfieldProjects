//
//BST.m
//Assignment 6
//
//Created by nzucker22 on 4/29/21.
//Copyright © 2021 nzucker22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BST.h"

@implementation BST

    -(instancetype) init{
        self = [super init];
        return self;
    }

    -(BOOL) containsWrapper:(int) key{
        if(self.root.key==key){
            return true;
        }
        else if([self contains:self.root.left:key] || [self contains:self.root.right:key]){
            return true;
        }
        return false;
    }
           
    -(BOOL) contains:(Node *) thisNode :(int) key{
        if(thisNode.key==key){
            return true;
        }
        else if([self contains:thisNode.left:key] || [self contains:thisNode.right:key]){
            return true;
        }
        else if([self isLeaf:thisNode]){
            return false;
        }
        else{
            return false;
        }
    }

//iteratively deletes node with given key, returning the root node of the updated tree
    -(Node *) delete:(int)key: (Node *)root{
        Node *prevNode = nil;
        Node *curNode = root;
        
//finds node with key, storing its previous key as prevNode
        while(curNode!=nil && curNode.key!=key){
            prevNode = curNode;
            if(curNode.key < key){
                curNode = curNode.right;
            }
            else{
                curNode = curNode.left;
            }
        }
        
//at this point, curNode is either the node with the target key or null
        if(curNode==nil){
//no node w/ target key in the tree, so return root w/ unchanged tree
            return root;
        }
        
//if target node has 0 or 1 child
        if(curNode.left==nil || curNode.right==nil){
            Node *replacement;
            if(curNode.right==nil)
                replacement = curNode.left;
            else
                replacement = curNode.right;
                
//if one child, I have now assigned the node (*replacement) that's going to take the deleted node's place
//if the node is a leaf, then I have assigned a null node (*replacement) to take its place
                
            if(prevNode==nil)
//if target node is the root
                return replacement;

            if(curNode==prevNode.right)
//this is the actual replacement step; I'm linking the rest of the tree (from prevNode) to the replacement node, effectively deleting the target node by not disconnecting it from tree
                prevNode.right = replacement;
            else
                prevNode.left = replacement;
        }
        
//if target node has 2 children
        else{
            
            Node *parentOfSuccessor;
            Node *successor;
//begin looking for successor to right of target node
            successor = curNode.right;
            while(successor.left!=nil){
                parentOfSuccessor = successor;
                successor = successor.left;
            }
//by now, leftmost node on the right of target node is successor
            NSLog(@"successor of target node: %i",successor.key);
            if(parentOfSuccessor==nil){
//this is true when the successor is directly the right child of the target node
                curNode.right = successor.right;
//this is part one of "replacing" curNode (target) with its successor
            }
            else{
//this is true when successor is more than one level away from target node
                parentOfSuccessor.left = successor.right;
//we connect this node to any nodes that were on the right of successor (as opposed to losing them), and we'll remember successor's                 key for the final step of replacing target node
            }
            curNode.key = successor.key;
//final step of replacement: replace key in target node with key from successor
        }
        return root;
    }

    -(Node *)findNodeWithKey:(int)key givenCurrentNode:(Node *)thisNode{
        if(thisNode==nil)
            return nil;
        if(thisNode.key==key)
            return thisNode;
        else if(key>thisNode.key)
            return [self findNodeWithKey:key givenCurrentNode:thisNode.right];
        else
            return [self findNodeWithKey:key givenCurrentNode:thisNode.left];
    }

    -(Node *)findSuccessorOfGivenNode:(Node *)thisNode{
        return [self findNodeWithKey:[self min:thisNode.right:0] givenCurrentNode:thisNode.right];
    }

    -(int) height:(Node *)thisNode{
        if(thisNode==nil){
            return 0;
        }
        else{
            int heightOfLeftSubtree = [self height:thisNode.left];
            int heightOfRightSubtree = [self height:thisNode.right];
            if(heightOfRightSubtree>=heightOfLeftSubtree)
                return (heightOfRightSubtree + 1);
//the +1 accounts for thisNode's height of 1, which does not get tallied in the two recursive calls above
            else
                return (heightOfLeftSubtree + 1);
//the if and else statements above ensure I only return the tallest/deepest possible
        }
    }

    -(BOOL) isEmpty{
        return(self.root==nil);
    }    //Returns true if this symbol table is empty.

    -(void) main: (int *) args{
            
    }   //Unit tests the BST data type

    -(int) maxWrapper{
        return ([self max:self.root:0]);
    }

    -(int) max:(Node *)thisNode:(int)curMax{
        if(thisNode==nil)
//base case
            return curMax;
        else{
            curMax = thisNode.key;
//step case: traverse down RIGHT side of tree until you reach a nil node (base case)
            return [self max:thisNode.right:curMax];
        }
    }
//
    -(int) minWrapper{
        return ([self min:self.root:0]);
    }

    -(int) min:(Node *)thisNode:(int)curMin{
        if(thisNode==nil)
//base case
            return curMin;
        else{
            curMin = thisNode.key;
//step case: traverse down LEFT side of tree
            return [self min:thisNode.left:curMin];
        }
    }

    -(void) levelOrderWrapper{
        int height = [self height:self.root];
        for(int i=0; i<height; i++){
//for loop prints every level from 0 to height of tree
            [self printLevel:i:self.root];
        }
    }

    -(void) printLevel:(int)level:(Node *)thisNode{
        if(thisNode==nil)
            return;
        if(level==0)
            NSLog(@"%i",thisNode.key);
//we are at the 0th level; the only node on this level is the root. Program only does this once
        else{
            [self printLevel:level-1:thisNode.left];
            [self printLevel:level-1:thisNode.right];
//these recursive calls keep DECREASING level until each child on the given level has a temporary level value of 0 -> then, program prints the node's key
        }
    }

    -(void) inOrderWrapper{
        [self inOrder:self.root];
    }

    -(void) inOrder:(Node *) thisNode{
        //base case
        if(thisNode==nil)
            return;
        //step case
        [self inOrder:thisNode.left];
        NSLog(@"%i",thisNode.key);
        [self inOrder:thisNode.right];
    }


    -(void) postOrderWrapper{
        [self postOrder:self.root];
    }

    -(void) postOrder:(Node *) thisNode{
        //base case
        if(thisNode==nil)
            return;
        //step case
        [self postOrder:thisNode.left];
        [self postOrder:thisNode.right];
        NSLog(@"%i",thisNode.key);
    }

    -(void) preOrderWrapper{
        [self preOrder:self.root];
    }

    -(void) preOrder:(Node *) thisNode{
        //base case
        if(thisNode==nil)
            return;
        //step case
        NSLog(@"%i",thisNode.key);
        [self preOrder:thisNode.left];
        [self preOrder:thisNode.right];
    }

   -(void) put: (int) key{
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
            NSLog(@"moved right");
            currentNode.right = [self putRecursive:key withCurrentNode: currentNode.right];
        }
        if (key < currentNode.key) {
            NSLog(@"moved left");
            currentNode.left = [self putRecursive:key withCurrentNode: currentNode.left];
        }
        NSLog(@"reached return");
        return currentNode;
    }

    -(int) sizeWrapper{
        return [self size:self.root];
    }

    -(int) size:(Node *)thisNode{
//base case #1: node is null, so don't add to count
        if(thisNode==nil){
            return 0;
        }
//step case: break down tree into left and right subtrees until base case is reached
        return [self size:thisNode.left] + [self size:thisNode.right] + 1;
    }

//determines if node is a leaf
    -(BOOL)isLeaf:(Node *)thisNode{
        if(thisNode.left==nil && thisNode.right==nil){
            return true;
        }
        return false;
    }

@end
