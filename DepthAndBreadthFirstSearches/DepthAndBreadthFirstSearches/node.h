//
//  node.h
//  StacksAndQueues
//
//  Created by hroche21 on 4/12/21.
//  Copyright © 2021 hroche21. All rights reserved.
//

#ifndef node_h
#define node_h

@interface Node : NSObject

@property id object;

@property Node *next;

- (instancetype)initWithObject:(id)object;

- (instancetype)initWithObject:(id)object andNextNode:(Node *)node;

- (instancetype)init;

@end


#endif /* node_h */
