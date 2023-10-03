//
//  Stack.m
//  StacksAndQueues
//
//  Created by hroche21 on 4/12/21.
//  Copyright © 2021 hroche21. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"

@implementation Stack : NSObject

-(bool) isEmpty {
    return self.top == nil;
}

-(Node*) pop {
    Node *temp = self.top;
    self.top = self.top.next;
    return temp;
}

-(id) peek{
    Node *temp = self.top;
    return temp.object;
}

-(void) push: (id) item{
    Node *temp = [Node alloc];
    temp = [temp initWithObject:item andNextNode: self.top];
    self.top = temp;
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

