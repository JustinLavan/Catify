//
//  catSavedData.h
//  CatifyMe-OBJ-C
//
//  Created by Lavan, Justin Thomas on 8/17/15.
//  Copyright (c) 2015 LaBarck. All rights reserved.
//


// This is abtract for the for catData
// it stores the url and date saved
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CatSavedData : NSManagedObject

@property (nonatomic, retain) NSDate * dateSaved;
@property (nonatomic, retain) NSString * urlName;

@end
