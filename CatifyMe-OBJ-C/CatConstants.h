//
//  CatConstants.h
//  CatifyMe-OBJ-C
//
//  Created by Joey LaBarck on 1/24/15.
//  Copyright (c) 2015 LaBarck. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CatConstants : NSObject

extern NSString * const kCatifyMeURLString;

extern NSString * const kDataKey;
extern NSString * const kImagesKey;
extern NSString * const kImageKey;
extern NSString * const kIDKey;
extern NSString * const kSourceURLKey;
extern NSString * const kURLKey;
// I added These
extern NSString * const CoreDataCatData;
extern NSString * const CoreDataDirectoryName;
extern NSString * const CoreDataDirectoryExtension;
extern NSString * const CoreDataFileNameInMemoryWithExtension;
extern NSString * const UserDefaultsAlert;
// decided to change it up
#define NotificationChangeAlertTime @"DidChangeAlertTime"

@end
