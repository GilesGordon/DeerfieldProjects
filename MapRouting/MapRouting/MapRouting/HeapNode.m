//
//  HeapNode.m
//  MapRouting
//
//  Created by ggordon22 on 5/25/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeapNode.h"

@implementation HeapNode : NSObject

- (instancetype)initWithObject: (id) object andKey: (double) key{
    self = [super init];
    self.key = key;
    self.value = object;
    return self;
}

@end
