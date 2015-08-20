//
//  CatsNoficiationTVC.m
//  CatifyMe-OBJ-C
//
//  Created by Lavan, Justin Thomas on 8/18/15.
//  Copyright (c) 2015 LaBarck. All rights reserved.
//

// 
#import "CatsNoficiationTVC.h"
#import "AppDelegate.h"
#import "CatConstants.h"

@interface CatsNoficiationTVC ()
@property (strong, nonatomic) NSArray *PickerInfo;
@end

@implementation CatsNoficiationTVC


int timer;
int storage;

- (void)awakeFromNib {
    _PickerInfo = @[@"half hour",@"1 hour",@"3 hours",@"1 day", @"never"];
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    
    [self.picker selectRow:1 inComponent:0 animated:YES];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

#pragma UItableViewMethods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [NSString stringWithFormat:@"%@",_PickerInfo[row]];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    
    if (component == 0) {
        switch (row) {
            case 0:{
                timer = 30*60;
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                [userDefaults setObject:@"50" forKey:UserDefaultsAlert];
                NSNotificationCenter *notcen = [NSNotificationCenter defaultCenter];
                [notcen postNotificationName:NotificationChangeAlertTime
                                      object:nil
                                    userInfo:@{@"newAlertTime" : @"50"}];
                NSLog(@"1800");

                break;
            }
            case 1:{
                timer = 60*60;
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                [userDefaults setObject:@"3600" forKey:UserDefaultsAlert];
                NSNotificationCenter *notcen = [NSNotificationCenter defaultCenter];
                [notcen postNotificationName:NotificationChangeAlertTime
                                      object:nil
                                    userInfo:@{@"newAlertTime" : @"3600"}];
                break;
            }
            case 2:{
                timer = 180*60;
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                [userDefaults setObject:@"10800" forKey:UserDefaultsAlert];
                NSNotificationCenter *notcen = [NSNotificationCenter defaultCenter];
                [notcen postNotificationName:NotificationChangeAlertTime
                                      object:nil
                                    userInfo:@{@"newAlertTime" : @"10800"}];
                break;
            }
            case 3:{
                timer = 24*60*60;
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                [userDefaults setObject:@"86400" forKey:UserDefaultsAlert];
                NSNotificationCenter *notcen = [NSNotificationCenter defaultCenter];
                [notcen postNotificationName:NotificationChangeAlertTime
                                      object:nil
                                    userInfo:@{@"newAlertTime" : @"86400"}];
                break;
            }
            case 4:{
                timer = 21*24*60*60;
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                [userDefaults setObject:@"1814400" forKey:UserDefaultsAlert];
                NSNotificationCenter *notcen = [NSNotificationCenter defaultCenter];
                [notcen postNotificationName:NotificationChangeAlertTime
                                      object:nil
                                    userInfo:@{@"newAlertTime" : @"1814400"}];
                break;
            }
            default:
                break;
        }
    }
    
}


@end
