//
//  Josephus.h
//  StacksAndQueues
//
//  Created by ggordon22 on 4/13/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef Josephus_h
#define Josephus_h
#import "Queue.h"

@interface Josephus: NSObject

@property Queue * circle;

- (id) solveJosephus: (int) S andPeople: (int) N;

@end

#endif /* Josephus_h */
