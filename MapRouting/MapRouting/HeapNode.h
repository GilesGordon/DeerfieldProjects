//
//  HeapNode.h
//  MapRouting
//
//  Created by ggordon22 on 5/25/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef HeapNode_h
#define HeapNode_h

@interface HeapNode : NSObject
@property double key;
@property id value;
- (instancetype)initWithObject: (id) object andKey: (double) key;
@end

#endif /* HeapNode_h */
