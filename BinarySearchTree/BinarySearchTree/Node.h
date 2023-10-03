//
//  node.h
//  StacksAndQueues
//
//  Created by hroche21 on 4/12/21.
//  Copyright © 2021 hroche21. All rights reserved.
//

#ifndef Node_h
#define Node_h

@interface Node : NSObject

@property id value;

@property int key;

@property Node *left;

@property Node *right;

- (instancetype)init;

@end


#endif /* Node_h */
