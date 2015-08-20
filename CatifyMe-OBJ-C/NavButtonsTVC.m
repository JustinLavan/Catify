//
//  NavButtonsTVC.m
//  CatifyMe-OBJ-C
//
//  Created by Lavan, Justin Thomas on 8/18/15.
//  Copyright (c) 2015 LaBarck. All rights reserved.
//

#import "NavButtonsTVC.h"
#


@implementation NavButtonsTVC


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
// this crashs the app, apparently you cant use buttons in a xib...
- (IBAction)touchCatsButton:(UIButton *)sender {
    
}


@end
