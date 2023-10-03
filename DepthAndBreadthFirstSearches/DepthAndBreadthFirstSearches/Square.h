//
//  Square.h
//  DepthAndBreadthFirstSearches
//
//  Created by ggordon22 on 4/21/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef Square_h
#define Square_h

@interface Square : NSObject

@property NSString* squareIndex;
@property NSString* previousSquareIndex;
- (instancetype)initWithSquareIndex:(NSString*) index andPreviousSquareIndex:(NSString*) previousIndex;
@end
#endif /* Square_h */
