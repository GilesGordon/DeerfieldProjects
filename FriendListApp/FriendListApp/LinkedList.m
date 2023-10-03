//
//  LinkListNode.m
//  LinkedListAndNode
//
//  Created by ggordon22 on 4/6/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"

@implementation LinkedList : NSObject

-(void)add:(id)object{ //iterative or recursive based on whether you are using the iterative or recursive version of "last".
    ListNode * newListNode = [[ListNode alloc]init];
    [newListNode setObject:object];
    if (self.head == nil) {
        [self setHead:newListNode];
    } else {
        [[self last] setNext:newListNode];
    }
}

//iterative or recursive based on whether you are using the iterative or recursive version of "nodeAt".
-(void)addObject:(id)object atIndex:(int)index{
    ListNode * newListNode = [[ListNode alloc]init];
    [newListNode setObject:object];
    newListNode.next = [self nodeAt:index];
    [newListNode setObject: object];
    if (index == 0) {
        [self setHead: newListNode];
    } else {
        [self nodeAt:index -1].next = newListNode;
    }
}

-(BOOL)isEmpty{
    return self.head == nil;
}

-(void)clear{
    [self setHead: nil];
}

-(void)print{ //iterative print
    ListNode* temp = self.head;
    while (temp.next != nil) {
        NSLog (@"%@",temp.object);
        temp = temp.next;
    }
    if (temp != nil) {
        NSLog (@"%@",temp.object);
    }
}

//-(void)print{ //recursive print
//    [self recursivePrint:self.head];
//}
//-(void)recursivePrint: (ListNode *)temp{
//    if (temp.next == nil) {
//        if (temp != nil) {
//            NSLog (@"%@",temp.object);
//        }
//    } else {
//    NSLog (@"%@",temp.object);
//        temp = temp.next;
//        [self recursivePrint:temp];
//    }
//}

-(void)friendPrint{ //for printing friend list
    ListNode* temp = self.head;
    while (temp.next != nil) {
        if (temp != self.head) {
        NSLog (@"%@",temp.object);
       }
        temp = temp.next;
    }
    if (temp != nil) {
        if (temp != self.head) {
        NSLog (@"%@",temp.object);
        }
    }
}

-(void)deleteNodeAtIndex:(int)index{    //iterative deleteNodeAtIndex
    //  [[self nodeAt:index -1] setNext: [self nodeAt:index].next]; //works
    
    ListNode* temp;
    if (index == 0){
        [self setHead: self.head.next];
    } else {
        temp = self.head;
        for(int i = 0; i<index -1; i++) {
            temp = temp.next;
        }
        [temp setNext: temp.next.next];
    }
}

//-(void)deleteNodeAtIndex:(int)index{  //recusive deleteNodeAtIndex
//    if (index == 0) {
//        [self setHead: self.head.next];
//    } else {
//        [self deleteNodeAtIndexRecursion:index withNode:self.head];
//    }
//}
//-(void)deleteNodeAtIndexRecursion:(int)index withNode:(ListNode *)temp{
//    if (index == 1){
//        [temp setNext: temp.next.next];
//    } else {
//        [self deleteNodeAtIndexRecursion:index -1 withNode: temp.next];
//    }
//}

-(ListNode *)first{
    return self.head;
}

-(ListNode *)last{    //iterative last
    ListNode* temp = self.head;
    while (temp.next != nil) {
        temp = temp.next;
    }
    return temp;
}

//-(ListNode *)last{  //recursive last
//    return [self recursiveLast: self.head];
//}
//-(ListNode *)recursiveLast: (ListNode *)temp {
//    if (temp.next == nil) {
//        return temp;
//    } else {
//        return [self recursiveLast: temp.next];
//    }
//}

-(ListNode *)nodeAt:(int)index{ //iterative nodeAt
    ListNode* temp;
    temp = self.head;
    for(int i = 0; i<index; i++) {
        temp = temp.next;
    }
    return temp;
}

//-(ListNode *)nodeAt:(int)index{ //recursive nodeAt
//    return [self nodeAtRecursion:index withNode:self.head];
//}
//-(ListNode *)nodeAtRecursion:(int)index withNode:(ListNode *)temp {
//    if (index == 0) {
//        return temp;
//    } else {
//        return [self nodeAtRecursion:index -1 withNode:temp.next];
//    }
//}


-(int)count{    //iterative count
    int nodes = 1;
    ListNode* temp = self.head;
    if (temp == nil) {
        return 0;
    } else {
        while (temp.next != nil) {
            nodes++;
            temp = temp.next;
        }
    }
    return nodes;
}

//-(int)count{    //recursive count
//    return [self countRecursion:self.head];
//}
//-(int)countRecursion:(ListNode *) temp{
//    if(temp == nil) {
//         return 0;
//    } else if(temp.next == nil) {
//         return 1;
//    } else {
//        temp = temp.next;
//        return 1+ [self countRecursion:temp];
//    }
//}


-(BOOL)isInList:(id)x { //iterative isInList
    ListNode* temp;
    temp = self.head;
    if ([temp.object isEqual: x] && self.head != nil) {
        return true;
    } else {
        for (int i = 0; i< [self count]-1; i++) {
            temp = temp.next;
            if ([temp.object isEqual: x]) {
                return true;
            }
        }
    }
    return false;
}

//-(BOOL)isInList:(id)x {  //recursive isInList
//    return [self isInListRecursion:x withNode:self.head];
//}
//-(BOOL)isInListRecursion:(id) withNode:(ListNode *)temp{
//    if (temp.next == nil) {
//        if (temp.object == x && temp != nil) {
//            return true;
//        }
//    } else {
//        if (temp.object == x && temp != nil) {
//            return true;
//        }
//       return [self isInListRecursion:x withNode:temp.next];
//    }
//    return false;
//}


-(BOOL)nameIsInList:(NSString *)x{
    ListNode* temp;
    temp = self.head;
    if ([[temp.object object] isEqual:x] && self.head != nil) {
        return true;
    } else {
        for (int i = 0; i< [self count]-1; i++) {
            temp = temp.next;
            if ([[temp.object object] isEqual:x]) {
                return true;
            }
        }
    }
    return false;
}

-(int) removeOccurences:(id) item { //iterative removeOccurences
    int index = 0;
    int occurences = 0;
    ListNode* temp;
    temp = self.head;
    while (index != [self count]) {
        if(temp.object == item) {
            temp = temp.next;
            [self deleteNodeAtIndex: index];
            occurences ++;
        } else {
            temp = temp.next;
            index++;
        }
    }
    return occurences;
}

//-(int) removeOccurences:(id) item {  //recursive removeOccurences
//    return [self removeOccurencesRecursion: item atIndex:0 withNode: self.head];
//}
//-(int) removeOccurencesRecursion:(id) item atIndex: (int)index withNode:(ListNode *)temp {
//    if (index == [self count] -1) {
//        if(temp.object == item) {
//            [self deleteNodeAtIndex: index];
//            return 1;
//        }
//    } else {
//        if(temp.object == item) {
//            [self deleteNodeAtIndex: index];
//            return 1 + [self removeOccurencesRecursion: item atIndex: index withNode: temp.next];
//        } else {
//        return [self removeOccurencesRecursion: item atIndex: index +1 withNode: temp.next];
//        }
//    }
//    return 0;
//}


//-(void)reverseList {  //iterative reverseList
//// First time made it the wrong way (with node creation for every node):
////
////    int place = 1;
////    for (int i = 0; i< [self count] -1; i++) {
////        [self add:[self nodeAt:[self count] -(place +1)].object];
////        place++;
////        [self deleteNodeAtIndex: [self count] - (place+1)];
////    }
//
//    int timesRun= [self count];
//    ListNode* temp = [self nodeAt: 0];
//    ListNode* temp2 = [self nodeAt: 1];
//    for (int i = 0; i< timesRun ;i++) {
//        [self setHead: temp];
//        temp = temp2;
//        temp2 = temp2.next;
//        [temp setNext:self.head];
//        if (i == 0) {
//            [self.head setNext: nil];
//        }
//    }
//}

-(void)reverseList {    //recursive reverseList
    ListNode* temp = self.head;
    ListNode* temp2 = self.head.next;
    [self.head setNext: nil];
    [self reverseListRecursion: temp withNode: temp2 withNode: nil];
}
-(void)reverseListRecursion:(ListNode *)temp withNode:(ListNode *)temp2 withNode:(ListNode *)oldHead{
    if (temp2 == nil) {
        [temp setNext:oldHead];
        [self setHead: temp];
    } else {
        [temp setNext:oldHead];
        ListNode* head = temp;
        temp = temp2;
        temp2 = temp2.next;
        [self reverseListRecursion: temp withNode: temp2 withNode: head];
    }
}



@end
