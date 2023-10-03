//
//  main.m
//  StacksAndQueues
//
//  Created by hroche21 on 4/12/21.
//  Copyright © 2021 hroche21. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"
#import "Queue.h"
#import "Josephus.h"
#import "ExpressionEvaluator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Josephus * x = [[Josephus alloc]init];
//        NSLog(@"the correct index to sit at is:%@", [x solveJosephus:3 andPeople:4]);
        
//        Stack* h = [[Stack alloc]init];
        
        
        ExpressionEvaluator * e = [[ExpressionEvaluator alloc]init];
        NSLog (@"%ld" ,[e evaluateExpression: @"((((3+4)*2)/2)-1)"]);
//
//        Stack *s = [[Stack alloc]init];
//        [s push:@"r"];
//        [s push:@"r"];
//        [s push:@"r"];
//        [s push:@"r"];
//        [s push:@"r"];
//        NSLog(@"%i", [s size]);
       
    }
    return 0;
}
