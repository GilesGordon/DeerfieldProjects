//
//  PathNode.m
//  MapRouting
//
//  Created by ggordon22 on 5/25/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PathNode.h"

@implementation PathNode : NSObject
- (instancetype)initWithCurrentCity: (int) cCity previousCity: (PathNode *)previousPathNode andDistanceFromStart: (double) dist {
    self = [super init];
    self.currentCity = cCity;
    self.previousPathNode = previousPathNode;
    self.distanceFromStart = dist;
    return self;
}
@end
