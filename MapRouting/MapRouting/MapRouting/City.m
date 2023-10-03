//
//  City.m
//  MapRouting
//
//  Created by ggordon22 on 5/25/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"

@implementation City : NSObject
- (instancetype)init {
    self = [super init];
    self.numberOfCityConnections = 0;
    self.connections = [[NSMutableArray alloc]init];
    return self;
    
}

@end
