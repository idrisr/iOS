//
//  BNRItemsViewController.m
//  BNRHomePwner
//
//  Created by idris on 4/5/15.
//  Copyright (c) 2015 Idris Raja. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemsViewController()
@property (nonatomic, strong) IBOutlet UIView *headerView;
@end

@implementation BNRItemsViewController

-(UIView *)headerView{
    if (!_headerView){
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
                                     owner:self
                                    options:nil];
    }
    return _headerView;
}

-(IBAction)addNewItem:(id)sender{
}

-(IBAction)toggleEditingMode:(id)sender{
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Create an instance of UITableViewCell, with default appearance

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    // Set the text on the cell with description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview

    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = items[indexPath.row];
    cell.textLabel.text = [item description];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return [[[BNRItemStore sharedStore] allItems] count];
}

-(instancetype) init{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self){
        for (int i = 0; i < 6; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewStyle)style{
    return [self init];
}

-(void) viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    [self.tableView setTableHeaderView:self.headerView];
}

@end
