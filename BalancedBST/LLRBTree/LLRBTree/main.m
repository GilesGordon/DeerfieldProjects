//
//  main.m
//  LLRBTree
//
//  Created by nzucker22 on 5/10/21.
//  Copyright © 2021 nzucker22. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LLRB.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        LLRB *redBlackTree = [[LLRB alloc]init];
//        test tree replicates tree from powerpoint
//        [redBlackTree putLLRB:7];
//        [redBlackTree putLLRB:5];
//        [redBlackTree putLLRB:9];
//        [redBlackTree putLLRB:3];
//        [redBlackTree putLLRB:6];
//        [redBlackTree putLLRB:8];
//        [redBlackTree putLLRB:11];
//        [redBlackTree putLLRB:2];
//        [redBlackTree putLLRB:4];
//        [redBlackTree putLLRB:10];
//        [redBlackTree putLLRB:1];
        
        LLRB *redBlackTree = [[LLRB alloc]init];
        LLRB *BST = [[LLRB alloc]init];
        
        NSString *data = @"";
        
        int maxPuts = 10000;
        int increment = 500;

        for(int puts=500; puts<=maxPuts; puts+=increment){
            long RBstartTime = mach_absolute_time();
            for(int i=0; i<puts; i++){
                [redBlackTree putLLRB:i];
            }
            long RBendTime = mach_absolute_time();
            long timeForLLRBPuts = RBendTime - RBstartTime;

            long BSTstartTime = mach_absolute_time();
            for(int j=0; j<puts; j++){
                [BST putBST:j];
            }
            long BSTendTime = mach_absolute_time();
            long timeForBSTPuts = BSTendTime - BSTstartTime;

            data = [data stringByAppendingFormat:@"%i, %ld, %ld\n", puts, timeForLLRBPuts, timeForBSTPuts];
        }
       
        NSURL *url = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask][0];
        url = [url URLByAppendingPathComponent:@"file.csv"];
        [data writeToURL:url atomically:true encoding:NSUTF8StringEncoding error:NULL];
    }
    return NSApplicationMain(argc, argv);
}
