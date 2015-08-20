//
//  AppDelegate.h
//  CatifyMe-OBJ-C
//
//  Created by Joey LaBarck on 1/22/15.
//  Copyright (c) 2015 LaBarck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageSegmentedController.h"
#import "likesViewController.h"
#import "settingsViewController.h"
#import "ViewController.h"

@class PageSegmentedController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) PageSegmentedController     * pageController;
@property (nonatomic) UISegmentedControl     * segmentedControl;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
- (NSURL *)applicationDocumentsDirectory;
- (void)saveContext;


@end

