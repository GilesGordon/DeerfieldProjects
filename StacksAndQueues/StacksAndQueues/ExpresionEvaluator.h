//
//  ExpresionEvaluator.h
//  StacksAndQueues
//
//  Created by ggordon22 on 4/13/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#ifndef ExpresionEvaluator_h
#define ExpresionEvaluator_h
#import "Stack.h"

@interface ExpresionEvaluator: NSObject

@property Stack * operandStack;
@property Stack * operatorStack;

- (int) evaluateExpresion: (NSString *) expresion

@end

#endif /* ExpresionEvaluator_h */
