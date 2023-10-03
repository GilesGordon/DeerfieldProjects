//
//  Square.m
//  DepthAndBreadthFirstSearches
//
//  Created by ggordon22 on 4/21/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Square.h"

@implementation Square : NSObject
- initWithSquareIndex:(NSString*) index andPreviousSquareIndex:(NSString*) previousIndex {
    self = [super init];
    if(self) {
        self.squareIndex = index;
        self.previousSquareIndex = previousIndex;
    }
    return self;
}
@end
