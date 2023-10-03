//
//  Queue.h
//  StacksAndQueues
//
//  Created by hroche21 on 4/12/21.
//  Copyright © 2021 hroche21. All rights reserved.
//

#ifndef Queue_h
#define Queue_h
#import "node.h"

@interface Queue : NSObject

@property Node *top;

-(void) enQueue: (id) item;

-(id) dequeue;

-(bool) isEmpty;

-(int) size;

@end


#endif /* Queue_h */
