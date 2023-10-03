//
//  ListNode.m
//  LinkedListAndNode
//
//  Created by ggordon22 on 4/6/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"

@implementation ListNode : NSObject

- (instancetype)initWithObject:(id)object{
    self.object = object;
    return self;
}

- (instancetype)initWithObject:(id)object andNextNode:(ListNode *)node{
    self.object = object;
    self.next = node;
    return self;
}

- (instancetype)init{
    return self;
}

@end

