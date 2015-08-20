
//
//  settingsViewController.m
//  CatifyMe-OBJ-C
//
//  Created by Lavan, Justin Thomas on 8/17/15.
//  Copyright (c) 2015 LaBarck. All rights reserved.
//

#import "settingsViewController.h"

@implementation settingsViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Settings";


    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    
    if (section== 0) {
    [tableView registerNib:[UINib nibWithNibName:@"NavButtonsView" bundle:nil] forCellReuseIdentifier:@"header"];
    headerView = [tableView dequeueReusableCellWithIdentifier:@"header"];
    }
    else{
        UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(10,0, 50, 50)];
        NSLog(@"here");
        headerView.backgroundColor = [UIColor grayColor];
        label.text = @"Data";

        [headerView addSubview:label];
    }
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        return 3;
    }
    else
        return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0){
    return 100.0f;
    }
    else
        return 60.f;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    switch (indexPath.section) {

        case 0:
            switch (indexPath.row) {
             
                case 0:
                   
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
                    cell.textLabel.text = @"Alert";
                    cell.backgroundColor = [UIColor grayColor];
                    
                    break;
                case 1:
                
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
                    cell.textLabel.text = @"When do you want more cats?";

                    break;
                case 2:
                    [tableView registerNib:[UINib nibWithNibName:@"CatsNoficiationView" bundle:nil] forCellReuseIdentifier:@"CatAlert"];
                    cell = [tableView dequeueReusableCellWithIdentifier:@"CatAlert"];
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:{
                    
                    [tableView registerNib:[UINib nibWithNibName:@"ClearCatsTVC" bundle:nil] forCellReuseIdentifier:@"DeleteCats"];
                    cell = [tableView dequeueReusableCellWithIdentifier:@"DeleteCats"];

                    break;
                    }
                    
                    
                default:
                    break;
            }
            break;
        default:
            break;
    }
    return cell;
}

-(void)viewDidUnload{
    [super viewDidUnload];
}
@end
