//
//  Queue.m
//  StacksAndQueues
//
//  Created by hroche21 on 4/12/21.
//  Copyright © 2021 hroche21. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Queue.h"

@implementation Queue : NSObject

-(void) enQueue: (id) item {
    Node *temp = [Node alloc];
    temp = [temp initWithObject:item andNextNode: self.top];
    self.top = temp;
}

-(id) dequeue {
    Node *temp = self.top;
    if( temp.next == nil) {
        id tempObject = temp.object;
        self.top = self.top.next;
        return tempObject;
    }
    while (temp.next.next != nil) {
        temp = temp.next;
    }
    id tempObject = temp.next.object;
    temp.next = temp.next.next;
    return tempObject;
    
}

-(bool) isEmpty {
    return self.top == nil;
}

-(int) size {
    Node *temp = self.top;
    int counter = 0;
    while (temp != NULL) {
        counter ++;
        temp = temp.next;
    }
    return counter;
}


@end
