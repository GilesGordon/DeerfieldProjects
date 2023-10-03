//
//  ViewController.m
//  FriendListApp
//
//  Created by ggordon22 on 4/9/21.
//  Copyright © 2021 ggordon22. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
LinkedList * everyone;
ListNode * me;
LinkedList * myFriends;
BOOL joined = false;

//    People * me;
- (IBAction)joinButton:(id)sender {
    if (joined == false) {
    me = [[ListNode alloc]init];
    [me setObject: @"me"];
    myFriends = [[LinkedList alloc]init];
    [myFriends setHead: me];
    [everyone addObject: me atIndex: 0];
    joined = true;
    }
}

- (IBAction)addButton:(id)sender {
    if ([myFriends isInList: [[self friendAddedBox]stringValue]] == false){
        [myFriends add: [[self friendAddedBox] stringValue]];
    }
    [myFriends friendPrint];
    NSLog(@"\n"); //will show the current friend list
}

- (IBAction)removeButton:(id)sender {
    if ([myFriends isInList: [[self friendAddedBox]stringValue]] == true) {
        [myFriends deleteNodeAtIndex:[self nodeIndexOfPersonFriends: [[self friendAddedBox]stringValue]]];
    }
    [myFriends friendPrint];
    NSLog(@"\n");
}
                
-(int) nodeIndexOfPerson: (NSString*)wantedFriend { //for everyone list
    ListNode* temp = [everyone head];
    int count = 0;
    while (temp != nil) {
        if ([[temp.object object] isEqual:wantedFriend]) {
            return count;
        } else {
            temp = temp.next;
            count++;
        }
    }
    return 0;
}

-(int) nodeIndexOfPersonFriends: (NSString*)wantedFriend { //for friend list
    ListNode* temp = [myFriends head];
    int count = 0;
    while (temp != nil) {
        if ([temp.object isEqual:wantedFriend]) {
            return count;
        } else {
            temp = temp.next;
            count++;
        }
    }
    return 0;
}

- (IBAction)inviteButton:(id)sender {
    LinkedList*inviteList = [[LinkedList alloc]init];
    for (int i = 1; i< [myFriends count]; i++) {
        if ([inviteList isInList: [myFriends nodeAt:i].object] == false) {
            [inviteList add: [myFriends nodeAt:i].object];
            NSString * str =[inviteList last].object;
            if ([everyone nameIsInList: str] == true) { //if they had friend, adds those friends as well
                LinkedList * tempFriendList = [[LinkedList alloc]init];
                [tempFriendList setHead: [everyone nodeAt: [self nodeIndexOfPerson: [myFriends nodeAt:i].object]].object];
                for (int j = 1; j<[tempFriendList count]; j++) {
                    if ([inviteList isInList: [tempFriendList nodeAt:j].object] == false) {
                        [inviteList add: [tempFriendList nodeAt:j].object];
                    }
                }
            }
        }
    }
    NSString * invitees;
    for (int i =0; i< [inviteList count]; i++) {
        if (i == 0) {
            invitees =[inviteList nodeAt:i].object;
        } else {
        invitees = [NSString stringWithFormat: @"%@\n%@", invitees, [inviteList nodeAt:i].object];
        }
    }
    [_inviteBox setString: invitees];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Ger is an established member of Friend List App. Adding him as a friend will make his friends (Yer and Ber) show up on the invite list.
    everyone = [[LinkedList alloc]init];
    ListNode* GerNode = [[ListNode alloc]init];
    ListNode* YerNode = [[ListNode alloc]init];
    ListNode* BerNode = [[ListNode alloc]init];
    [GerNode setObject:@"Ger"];
    [YerNode setObject:@"Yer"];
    [BerNode setObject:@"Ber"];
    [everyone add:GerNode];
    [GerNode setNext: YerNode];
    [YerNode setNext: BerNode];
    
//     me = [[People alloc]init];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
