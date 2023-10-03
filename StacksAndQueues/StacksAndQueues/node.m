//
//  node.m
//  StacksAndQueues
//
//  Created by hroche21 on 4/12/21.
//  Copyright © 2021 hroche21. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "node.h"


@implementation Node : NSObject

{
    //int object;
    
    //ListNode *next;
}
- (instancetype)initWithObject:(id)object {
    self = [super init];
    if(self) {
        self.object = object;
    }
    return self;
}

- (instancetype)initWithObject:(id)object andNextNode:(Node *)node {
    self = [super init];
    if(self) {
        self.object = object;
        self.next = node;
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    return self;
}

@end
