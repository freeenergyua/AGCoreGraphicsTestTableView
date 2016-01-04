//
//  CoolTableViewController.m
//  AGCustomTable
//
//  Created by User on 04.01.16.
//  Copyright © 2016 User. All rights reserved.
//

#import "CoolTableViewController.h"
#import "CustomTableCellBackground.h"
#import "CustomHeader.h"

@interface CoolTableViewController ()

@property (copy) NSMutableArray *toLearn;
@property (copy) NSMutableArray *justLearned;


@end

@implementation CoolTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Custom table Yeees!";
    self.toLearn = [@[@"Core Data",@"UIkit",@"Console"]mutableCopy];
    self.justLearned = [@[@"Git",@"JIRA",@"Xcode"]mutableCopy];
    
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.toLearn.count;
    } else {
        return  self.justLearned.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSString *entry;
    
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    //start new bacground
    if (![cell.backgroundView isKindOfClass:[CustomTableCellBackground class]]) {
        cell.backgroundView = [[CustomTableCellBackground alloc]init];
    }
    if (![cell.selectedBackgroundView isKindOfClass:[CustomTableCellBackground class]]) {
        cell.selectedBackgroundView = [[CustomTableCellBackground alloc]init];
    }
    
    if (indexPath.section == 0) {
        entry = self.toLearn[indexPath.row];
    } else {
        entry = self.justLearned[indexPath.row];
    }
    cell.textLabel.text = entry;
    cell.textLabel.backgroundColor = [UIColor clearColor];//clear color
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0){
        return @"Things to learn";
    } else {
        return @"Thinks have been learned";
    }
}
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CustomHeader * header = [[CustomHeader alloc] init];
    header.titleLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    return header;
}
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

@end
