//
//  Heap.h
//  MapRouting
//
//  Created by ggordon22 on 5/25/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef Heap_h
#define Heap_h
#import "HeapNode.h"

@interface Heap : NSObject
@property NSMutableArray *heap;
@property int size;
-(int) parent: (int) i; //returns parent node of index
-(int) left: (int) i; //returns left node of index
-(int) right: (int) i; //returns right node of index
-(id) min;
-(void) addObject:(id) object withKey: (double) key;
-(id) removeMin;
- (instancetype)init;

@end

#endif /* Heap_h */
