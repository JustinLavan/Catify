//
//  PageSegmentedController.h
//  CatifyMe-OBJ-C
//
//  Created by Lavan, Justin Thomas on 8/17/15.
//  Copyright (c) 2015 LaBarck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface PageSegmentedController : NSObject


@property (nonatomic, strong) UINavigationController *navController;
@property (nonatomic, strong) NSArray *views;

-(id)initCustomNavController:(UINavigationController *)NavController withViews:(NSArray *) views;
-(void)NavControllerIndexDidChange:(UISegmentedControl *)NavController;

@end
