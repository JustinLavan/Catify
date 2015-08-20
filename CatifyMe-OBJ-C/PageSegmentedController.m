//
//  PageSegmentedController.m
//  CatifyMe-OBJ-C
//
//  Created by Lavan, Justin Thomas on 8/17/15.
//  Copyright (c) 2015 LaBarck. All rights reserved.
//

// this class was made to create a page segmented controller that could move between views

#import "PageSegmentedController.h"

@implementation PageSegmentedController

-(id)initCustomNavController:(UINavigationController *)mainNavController withViews:(NSArray *)allViews{
    if (self = [super init]) {
        self.navController = mainNavController;
        self.views = allViews;
    }
    return  self;
    
}
-(void)NavControllerIndexDidChange:(UISegmentedControl *)NavController{
    NSUInteger index = NavController.selectedSegmentIndex;
    UIViewController * newView = [self.views objectAtIndex:index];
    
    NSArray * theViewControllers = [NSArray arrayWithObject:newView];
    [self.navController setViewControllers:theViewControllers animated:NO];
    
    newView.navigationItem.titleView = NavController;

    
}



@end
