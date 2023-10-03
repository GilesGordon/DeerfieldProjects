//
//  LinkListNode.h
//  LinkedListAndNode
//
//  Created by ggordon22 on 4/6/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef LinkedList_h
#define LinkedList_h

#import "ListNode.h"


@interface LinkedList<ObjectType> : NSObject
@property ListNode* head;

// inserts a node at the head of the list

-(void)add:(id)object;



// adds a value at an index

-(void)addObject:(id)object atIndex:(int)index;



//check is the linked list is empty

-(BOOL)isEmpty;



//clear the linked list

-(void)clear;



//print out every element in the list

-(void)print;



//prints node objects (specially for friend list)
-(void)friendPrint;



//removes a node at a given index

-(void)deleteNodeAtIndex:(int)index;



//return the first node of the list

-(ListNode *)first;



//return the last node of the list.
-(ListNode *)last;



// returns the number of items in the list

-(int)count;



// returns a pointer to a node at the given index
-(ListNode *)nodeAt:(int)index;



//returns true if the item is in the list, false otherwise

-(BOOL)isInList:(id)x;


//returns true if the name is in the list, false otherwise (specially for friend list)
-(BOOL)nameIsInList:(NSString*) x;


// removes all occurrences of an item and returns the total number of items removed
// this can be done by using other previously written methods

-(int) removeOccurences:(id) item;



// reverses the list

-(void)reverseList;


@end

#endif
