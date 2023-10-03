//
//  Josephus.m
//  StacksAndQueues
//
//  Created by ggordon22 on 4/13/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Josephus.h"
@implementation Josephus: NSObject

- (id) solveJosephus: (int) S andPeople: (int) N{
    Queue *peopleQueue = [[Queue alloc] init];
    for(int i =0; i<N; i++) {
        [peopleQueue enQueue: [NSNumber numberWithInteger:i]];
    }
    [self setCircle:peopleQueue];
    while ([self.circle size] >1){
        for (int i = 0; i< S; i++){
            [self.circle enQueue: [self.circle dequeue]];
        }
        NSLog(@"person eliminated is: %@", [self.circle dequeue]);
    }
    return self.circle.top.object;
}

@end
