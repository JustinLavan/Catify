//
//  CatsNoficiationTVC.h
//  CatifyMe-OBJ-C
//
//  Created by Lavan, Justin Thomas on 8/18/15.
//  Copyright (c) 2015 LaBarck. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatsNoficiationTVC : UITableViewCell <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end
