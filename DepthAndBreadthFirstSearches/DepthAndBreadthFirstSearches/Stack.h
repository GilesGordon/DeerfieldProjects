//
//  Stack.h
//  StacksAndQueues
//
//  Created by hroche21 on 4/12/21.
//  Copyright © 2021 hroche21. All rights reserved.
//

#ifndef Stack_h
#define Stack_h
#import "node.h"

@interface Stack : NSObject

@property Node *top;

-(bool) isEmpty;

-(Node*) pop;

-(id) peek;

-(void) push: (id) item;

-(int) size;





@end


#endif /* Stack_h */




