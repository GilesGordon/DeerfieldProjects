//
//  ExpressionEvaluator.h
//  StacksAndQueues
//
//  Created by ggordon22 on 4/13/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef ExpressionEvaluator_h
#define ExpressionEvaluator_h
#import "Stack.h"

@interface ExpressionEvaluator: NSObject

@property Stack* operandStack;
@property Stack* operatorStack;
@property Stack* tempOperatorStack;
@property Stack* tempOperandStack;
@property Stack* tempOperandStackFlipped;

- (NSInteger) evaluateExpression: (NSString *) expression;

@end

#endif /* ExpressionEvaluator_h */

