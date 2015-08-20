//
//  ClearCatsTVC.m
//  CatifyMe-OBJ-C
//
//  Created by Lavan, Justin Thomas on 8/18/15.
//  Copyright (c) 2015 LaBarck. All rights reserved.
//
// ViewController for the clear button table cell

#import "ClearCatsTVC.h"
#import "catSavedData+Create.h"
#import "AppDelegate.h"

@implementation ClearCatsTVC

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)touchDelete:(UIButton *)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [CatSavedData deleteCatDatainManagedObjectContext:appDelegate.managedObjectContext];
}



@end