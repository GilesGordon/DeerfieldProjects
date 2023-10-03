//
//  Node.m
//  LLRBTree
//
//  Created by nzucker22 on 5/10/21.
//  Copyright © 2021 nzucker22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@implementation Node

- (instancetype)init {
    self = [super init];
    return self;
}

- (instancetype)initWithKey: (int) key{
    self = [super init];
    self.key = key;
    return self;
}

@end
