//
//  catSaved+Create.m
//  CatifyMe-OBJ-C
//
//  Created by Lavan, Justin Thomas on 8/17/15.
//  Copyright (c) 2015 LaBarck. All rights reserved.
//

#import "CatSavedData+Create.h"
#import "CatConstants.h"
#import "AppDelegate.h"

@implementation CatSavedData (Create)

//Creates a cat data in the context, time, urlstring
+(CatSavedData *) createSavedCatatTime:(NSDate *)time
                               UrlName:(NSString *)urlString
                inManagedObjectContext:(NSManagedObjectContext *)context
{
    CatSavedData *catData = [NSEntityDescription insertNewObjectForEntityForName:CoreDataCatData
                                                         inManagedObjectContext:context];
    
    [catData setDateSaved:time];
    [catData setUrlName:urlString];

    
    return catData;
}

//adds an already created catdata to the managedobjectcontext
+ (void)addSavedCatatTime:(NSDate *)time
                 UrlName:(NSString *)urlString
      inManagedObjectContext:(NSManagedObjectContext *)context
{
    CatSavedData *catData = [NSEntityDescription insertNewObjectForEntityForName:CoreDataCatData
                                                         inManagedObjectContext:context];
    [catData setDateSaved:time];
    
    [catData setUrlName:urlString];
    NSLog(@"%@",catData);

}

//Is primarly used to pull the data from core data
+(NSArray *)getSavedCatDataInManagedObjectContext:(NSManagedObjectContext *)context
{
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:CoreDataCatData];
    
    NSError *fail;
    NSArray *catData = [context executeFetchRequest:request
                                                 error:&fail];
    
    if (fail) {
        NSLog(@"%@",fail);
        abort();
    }
    NSLog(@"%@", catData);
    
    return catData;
}


// Is primarly used to help delete a specific cat

+(NSArray *)getSavedCatDataAtTime:(NSDate *)time
inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:CoreDataCatData];
    if (time && request) {
        [request setPredicate:[NSPredicate predicateWithFormat:@"timeSaved == %@",time]];
        [request setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:CoreDataCatData
                                                                    ascending:YES]]];
    }
    
    NSError *fail;
    NSArray *catData = [context executeFetchRequest:request
                                                 error:&fail];
    
    if (fail) {
        NSLog(@"%@",fail);
        abort();
    }
    
    return catData;

}

//will delete only one cat
+ (void)deleteCatDataWithDate:(NSDate *)time
       inManagedObjectContext:(NSManagedObjectContext*)context{
    
    NSArray *toDelete = [CatSavedData getSavedCatDataAtTime:time inManagedObjectContext:context];
    for (CatSavedData* cats in toDelete) {
        [context deleteObject:cats];
    }
}

//will delete the list of cat urls
+(void)deleteCatDatainManagedObjectContext:(NSManagedObjectContext *)context{
    NSArray *toDelete = [CatSavedData getSavedCatDataInManagedObjectContext:context];
    for (CatSavedData* cats in toDelete) {
        [context deleteObject:cats];
    }
}

@end

