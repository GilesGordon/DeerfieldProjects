//
//  PathNode.h
//  MapRouting
//
//  Created by ggordon22 on 5/25/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef PathNode_h
#define PathNode_h

@interface PathNode : NSObject
@property int currentCity;
@property double distanceFromStart;
@property PathNode *previousPathNode;
- (instancetype)initWithCurrentCity: (int) cCity previousCity: (PathNode *)previousPathNode andDistanceFromStart: (double) dist;


@end

#endif /* PathNode_h */
