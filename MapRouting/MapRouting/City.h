//
//  City.h
//  MapRouting
//
//  Created by ggordon22 on 5/25/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef City_h
#define City_h
@interface City : NSObject
@property int x;
@property int y;
@property NSMutableArray *connections;
@property int numberOfCityConnections;
- (instancetype)init;


@end

#endif /* City_h */
