//
//  catSaved+Create.h
//  CatifyMe-OBJ-C
//
//  Created by Lavan, Justin Thomas on 8/17/15.
//  Copyright (c) 2015 LaBarck. All rights reserved.
//

#import "CatSavedData.h"

@interface CatSavedData (Create)

+(CatSavedData*) createSavedCatatTime:(NSDate *)time
                              UrlName:(NSString *)urlString
               inManagedObjectContext:(NSManagedObjectContext *)context;

+ (void)addSavedCatatTime:(NSDate *)time
                 UrlName:(NSString *)urlString
   inManagedObjectContext:(NSManagedObjectContext *)context;

+ (NSArray *)getSavedCatDataInManagedObjectContext:(NSManagedObjectContext *)context;

+ (NSArray *)getSavedCatDataAtTime:(NSDate *)time
           inManagedObjectContext:(NSManagedObjectContext *)context;

+ (void)deleteCatDataWithDate:(NSDate *)time
       inManagedObjectContext:(NSManagedObjectContext*)context;
+(void)deleteCatDatainManagedObjectContext:(NSManagedObjectContext *)context;

@end
