//
//  AppDelegate.m
//  CatifyMe-OBJ-C
//
//  Created by Joey LaBarck on 1/22/15.
//  Copyright (c) 2015 LaBarck. All rights reserved.
//

#import "AppDelegate.h"
#import "CatConstants.h"


@interface AppDelegate ()
@property (nonatomic) NSInteger alertTime;
@end

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                   inDomains:NSUserDomainMask] lastObject];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   // self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NSArray * viewControllers = [self viewControllerList];
    
    UINavigationController * navigationController = [[UINavigationController alloc] init];
    
    self.pageController = [[PageSegmentedController alloc] initCustomNavController:navigationController withViews:viewControllers];
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects: @"Cats", @"Likes", @"Settings", nil]];
    
    [self.segmentedControl addTarget:self.pageController
                              action:@selector(NavControllerIndexDidChange:)
                    forControlEvents:UIControlEventValueChanged];
    [self.window addSubview:navigationController.view];
    [self.window makeKeyAndVisible];
    [self registerForLocalNotifications];
    [self listenForNotifications];
    return YES;
}

- (void)firstUserExperience {
    self.segmentedControl.selectedSegmentIndex = 1;
    [self.pageController NavControllerIndexDidChange:self.segmentedControl];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)registerForLocalNotifications {
    UIUserNotificationType types = UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    [self scheduleLocalNotifications:self.alertTime];
}


//this method was here but it never was called so I changed it to take in the time parameter It is now a mess because i couldnt get it to alert me in 50 seconds on the simulation, and I cant test it on my phone
- (void)scheduleLocalNotifications:(NSInteger)time {
    NSDate *now = [NSDate date];
    NSCalendar *this = [NSCalendar currentCalendar];
    NSDateComponents *moment = [this components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:now];
    NSInteger hours;
    NSInteger mins;
    NSInteger seconds;
    NSInteger theHours;
    NSInteger theMinutes;
    NSInteger theSeconds;
    UILocalNotification *localNotif = [UILocalNotification new];
    
    NSDate *today = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:today];
    hours = time / 3600;
    mins = (time-(hours * 3600)) / 60;
    seconds = time-(hours*3600)-(mins*60);
        NSLog(@"time %i, hours %i, mins %i, sec %i", time,hours, mins, seconds);
    theHours = hours+[moment hour];
    theMinutes = mins+[moment minute];
    theSeconds = seconds +[moment second];
    if(theSeconds >= 60){
        theSeconds -= 60;
        theMinutes++;
    }
    if(theMinutes >= 60){
        theMinutes -= 60;
        theHours++;
    }
    
    [components setHour:theHours];
    [components setMinute:theMinutes];
    [components setSecond:theSeconds];
            NSLog(@" hours %i, mins %i, sec %i", [components hour], [components minute], [components second]);
    NSDate *start = [calendar dateFromComponents:components];
    localNotif.fireDate = start;
    localNotif.repeatInterval = NSCalendarUnitHour;
    localNotif.alertBody = @"You have a new cat waiting for you!";
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}

- (NSArray *)viewControllerList {
    UIViewController * main     = [[ViewController  alloc] init];
    UIViewController * likes    = [[likesViewController alloc] init];
    UIViewController * settings = [[settingsViewController alloc]init];
    
    NSArray * viewControllers = [NSArray arrayWithObjects:main, likes, settings, nil];
    
    return viewControllers;
}
#pragma coreData
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:CoreDataDirectoryName
                                              withExtension:CoreDataDirectoryExtension];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:CoreDataFileNameInMemoryWithExtension];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                   configuration:nil
                                                             URL:storeURL
                                                         options:nil
                                                           error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}
- (void)saveContext
{
    NSError *error;
    if (self.managedObjectContext != nil) {
        if ([self.managedObjectContext hasChanges] && ![self.managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}
- (void)listenForNotifications
{
    [[NSNotificationCenter defaultCenter] addObserverForName:NotificationChangeAlertTime
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note){
                                                      NSInteger delay = [[note.userInfo objectForKey:@"newAlertTime" ] integerValue];
                                                      self.alertTime = delay;
                                                      [self scheduleLocalNotifications:self.alertTime];
                                                      }];
}
@end
