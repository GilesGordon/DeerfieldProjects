//
//  main.m
//  BinarySearchTree
//
//  Created by ggordon22 on 4/30/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BinarySearchTree.h"

int main(int argc, const char * argv[]) {
    
    BinarySearchTree *tree = [[BinarySearchTree alloc] init];

    [tree put:4 withValue:[NSString stringWithFormat: @"%i",4]];
    [tree put:2 withValue:[NSString stringWithFormat: @"%i",2]];
    [tree put:1 withValue:[NSString stringWithFormat: @"%i",1]];
    [tree put:6 withValue:[NSString stringWithFormat: @"%i",6]];
    [tree put:5 withValue:[NSString stringWithFormat: @"%i",5]];
    [tree put:7 withValue:[NSString stringWithFormat: @"%i",7]];
    [tree put:8 withValue:[NSString stringWithFormat: @"%i",8]];


    
//method testing
    
//max, min, and put methods

    NSLog(@"The max is %i", tree.max);
    NSLog(@"The min is %i", tree.min);

//contains method
    
    if ([tree contains:5] == false) {
        NSLog (@"5 is not there");
    } else {
        NSLog (@"5 is there");
    }

    if ([tree contains:9] == false) {
        NSLog (@"9 is not there");
    } else {
        NSLog (@"9 is there");
    }
    
//size method
    NSLog(@"the size of the tree is %i", tree.size);
    
//order traversals
    NSLog(@"\n");
    NSLog(@"inorder");
    [tree inorder];
    NSLog(@"\n");
    NSLog(@"postorder");
    [tree postorder];
    NSLog(@"\n");
    NSLog(@"preorder");
    [tree preorder];
    NSLog(@"\n");
    NSLog(@"levelorder");
    [tree levelorder];
    NSLog(@"\n");
    
//height
     NSLog(@" the height of the tree is %i", tree.height);
    
//remove
    [tree remove:7];
    [tree remove:1];
    [tree remove:4];
    [tree remove:8];
    NSLog(@"\n");
    NSLog(@"inorder after removing values");
    [tree inorder];


    return NSApplicationMain(argc, argv);
}
