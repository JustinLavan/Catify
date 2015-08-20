//
//  likesViewController.m
//  CatifyMe-OBJ-C
//
//  Created by Lavan, Justin Thomas on 8/17/15.
//  Copyright (c) 2015 LaBarck. All rights reserved.
//

#import "likesViewController.h"
#import "AppDelegate.h"
#import "catSavedData+Create.h"

@interface likesViewController ()
@property (strong, nonatomic) NSMutableArray *likedCats;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@end

@implementation likesViewController

@synthesize urlList;

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Likes";
    //likesViewController  *itemsViewController =
   // [[likesViewController alloc] init];
    //[self.tableView registerClass:[UITableViewCell class]
    
    [self.urlList addObject:@"www.ww.com"];
}

// this is an array that is filled with core data
-(NSMutableArray *)LikedCats
{
   if (!_likedCats) {
       AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
       _likedCats = [NSMutableArray arrayWithArray:[CatSavedData getSavedCatDataInManagedObjectContext:appDelegate.managedObjectContext]];
    }
    return _likedCats;
}


#pragma tableViewMethods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.likedCats count];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    
    if (section== 0) {
        [tableView registerNib:[UINib nibWithNibName:@"NavButtonsView" bundle:nil] forCellReuseIdentifier:@"header"];
        headerView = [tableView dequeueReusableCellWithIdentifier:@"header"];
    }
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
        return 100.0f;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if(!cell){
         cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    

    cell.textLabel.text = self.likedCats[indexPath.row];
    return cell;
}




-(void)viewDidUnload{
    [super viewDidUnload];
}

@end
