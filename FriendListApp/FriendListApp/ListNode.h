//
//  ListNode.h
//  LinkedListAndNode
//
//  Created by ggordon22 on 4/6/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef ListNode_h
#define ListNode_h


@interface ListNode : NSObject

@property id object;

@property ListNode *next;

- (instancetype)initWithObject:(id)object;

- (instancetype)initWithObject:(id)object andNextNode:(ListNode *)node;

- (instancetype)init;


@end

#endif
