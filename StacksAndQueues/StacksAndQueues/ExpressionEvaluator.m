//
//  ExpressionEvaluator.m
//  StacksAndQueues
//
//  Created by ggordon22 on 4/13/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionEvaluator.h"
@implementation ExpressionEvaluator: NSObject

- (NSInteger) evaluateExpression: (NSString *) expression { //doesn't work
    self.operandStack = [[Stack alloc] init];
    self.operatorStack = [[Stack alloc] init];
    self.tempOperatorStack = [[Stack alloc] init];
    self.tempOperandStack = [[Stack alloc] init];
    self.tempOperandStackFlipped = [[Stack alloc]init];
    NSString * charString;
    for (NSInteger i = expression.length; i> 0; i--) { //puts operands and operators in correct stacks
        charString = [expression substringWithRange:NSMakeRange(i-1, 1)];
        NSInteger charInt = [charString integerValue];
        if (charInt >= 1 && charInt <= 9) { //multi digit numbers?
            [self.operandStack push: charString];
        } else {
            [self.operatorStack push: charString];
        }
    }

    while ([_operandStack size]+[_tempOperandStackFlipped size]>1) {
        NSString * tempOperator;
        NSString * currentOperator = @"";
        while([currentOperator isEqualToString: @")"] == false && [_operatorStack isEmpty] == false){
            currentOperator = [self.operatorStack pop].object;
            if ([currentOperator isEqualToString: @"("] == false && [currentOperator isEqualToString: @")"] ==false) {
                if ([tempOperator isEqualToString:@""] == false) {
                    [self.tempOperandStack push: [self.operandStack pop].object];
                }
                tempOperator = currentOperator;
                [_tempOperatorStack push:tempOperator];
            }
        }

        tempOperator = [_tempOperatorStack pop].object;
        NSInteger firstOperand= 0;
        NSInteger secondOperand= 0;

        int tempSize = [_tempOperandStack size];
        for (int i = 0; i<tempSize; i++) {
            [_tempOperandStackFlipped push: [_tempOperandStack pop].object];
        }

        if (self.operandStack.top != nil) {
        firstOperand = [[self.operandStack pop].object integerValue];
        } else {
        firstOperand = [[self.tempOperandStackFlipped pop].object integerValue];
        }

        if (self.operandStack.top != nil) {
        secondOperand = [[self.operandStack pop].object integerValue];
        } else {
        secondOperand = [[self.tempOperandStackFlipped pop].object integerValue];
        }

        NSInteger result = 0;
        if ([tempOperator isEqualToString:@"+"] == true){ //if time, figure out how to do this generically
            result = firstOperand + secondOperand;
        }
        if ([tempOperator isEqualToString:@"-"] == true){
            result = secondOperand - firstOperand;
        }
        if ([tempOperator isEqualToString:@"/"] == true){
            result = secondOperand/firstOperand;
        }
        if ([tempOperator isEqualToString:@"*"] == true){
            result = firstOperand*secondOperand;
        }
        //add other operations
        NSString * resultString = [NSString stringWithFormat: @"%ld", result];
        [self.operandStack push: resultString];
    }
    if (self.operandStack.top != nil) {
        return [[self.operandStack pop].object integerValue];
    } else {
        return [[self.tempOperandStackFlipped pop].object integerValue];
    }
}


//working no extensions
//- (NSInteger) evaluateExpression: (NSString *) expression {
//    self.operandStack = [[Stack alloc] init];
//    self.operatorStack = [[Stack alloc] init];
//    NSString * charString;
//    for (NSInteger i = expression.length; i> 0; i--) { //puts operands and operators in correct stacks
//        charString = [expression substringWithRange:NSMakeRange(i-1, 1)];
//        NSInteger charInt = [charString integerValue];
//        if (charInt >= 1 && charInt <= 9) { //extension: multi digit numbers?
//            [self.operandStack push: charString];
//        } else {
//            [self.operatorStack push: charString];
//        }
//    }
//
//    while ([_operandStack size]>1) {
//        NSString * tempOperator;
//        NSString * currentOperator = @"";
//        while([currentOperator isEqualToString: @")"] == false){
//             currentOperator = [self.operatorStack pop].object;
//            if ([currentOperator isEqualToString: @"("] == false && [currentOperator isEqualToString: @")"] ==false) {
//                tempOperator = currentOperator;
//            }
//        }
//        NSInteger firstOperand= 0;
//        NSInteger secondOperand= 0;
//        firstOperand = [[self.operandStack pop].object integerValue];
//        secondOperand = [[self.operandStack pop].object integerValue];
//
//        NSInteger result = 0;
//        if ([tempOperator isEqualToString:@"+"] == true){ //if time, figure out how to do this generically
//            result = firstOperand + secondOperand;
//        }
//        if ([tempOperator isEqualToString:@"-"] == true){
//            result = firstOperand - secondOperand;
//        }
//        if ([tempOperator isEqualToString:@"/"] == true){
//            result = firstOperand/secondOperand;
//        }
//        if ([tempOperator isEqualToString:@"*"] == true){
//            result = firstOperand*secondOperand;
//        }
//        NSString * resultString = [NSString stringWithFormat: @"%ld", result];
//        [self.operandStack push: resultString];
//    }
//    return [[self.operandStack pop].object integerValue];
//}

@end
