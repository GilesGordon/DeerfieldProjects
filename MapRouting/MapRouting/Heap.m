//
//  Heap.m
//  MapRouting
//
//  Created by ggordon22 on 5/25/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Heap.h"

@implementation Heap : NSObject

-(int) parent: (int) i {
    return (i-1)/2;
}

-(int) left: (int) i {
    return (2*i+1);
}

-(int) right: (int) i {
    return (2*i+2);
}

-(id) min {
    return self.heap[0];
}

-(void) addObject:(id) object withKey: (double) key {
    HeapNode *newHeapNode = [[HeapNode alloc]initWithObject:object andKey:key];
    int currentIndex = self.size;
    int parentIndex = [self parent:(currentIndex)];
    self.size++;
    [self.heap addObject: newHeapNode];
    while (((HeapNode *)self.heap[parentIndex]).key > key && currentIndex != 0) {
        self.heap[currentIndex] = self.heap[parentIndex];
        self.heap[parentIndex] = newHeapNode;
        currentIndex = parentIndex;
        parentIndex = [self parent: currentIndex];
    }
}

-(id) removeMin { //returns the value which in Dijsktra's Algorithm is a path node
    id val = ((HeapNode*)self.heap[0]).value;
    if (self.size <= 0) {
        return nil;
    }
    if (self.size == 1) {
        [self.heap removeLastObject];
        self.size--;
        return val;
    }
    self.heap[0] = self.heap[self.size-1];
    [self.heap removeLastObject];
    self.size--;
    [self makeHeapWithRoot:0];
    
    return val;
}

-(void) makeHeapWithRoot: (int) root{
    int smallest = root;
    int left = [self left:root];
    int right = [self right:root];
    if (left < self.size && ((HeapNode *)self.heap[left]).key < ((HeapNode *)self.heap[root]).key) {
        smallest = left;
    }
    if (right < self.size && ((HeapNode *)self.heap[right]).key < ((HeapNode *)self.heap[smallest]).key) {
        smallest = right;
    }
    if (smallest != root) {
        HeapNode *temp = [[HeapNode alloc]init];
        temp = (HeapNode *)self.heap[root];
        self.heap[root] = self.heap[smallest];
        self.heap[smallest] = temp;
        [self makeHeapWithRoot: smallest];
    }
}

- (instancetype)init {
    self = [super init];
    self.size = 0;
    self.heap = [[NSMutableArray alloc]init];
    return self;
}
@end
