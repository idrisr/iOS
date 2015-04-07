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

    // create a new BNRItem and add it to the store
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];

    // Figure out where that item is in the array;
    NSInteger lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];

    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:lastRow inSection:0];

    // insert this new row into the table
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
}

-(IBAction)toggleEditingMode:(id)sender{
    // If you are currently in editing mode...
    if (self.isEditing){
        // Change text of button to inform user of state
        [sender setTitle:@"Edit" forState:UIControlStateNormal];

        // turn off editing mode
        [self setEditing:NO animated:YES];
    } else {
        // Change text of button to inform user of state
        [sender setTitle:@"Done" forState:UIControlStateNormal];

        // enter editing mode
        [self setEditing:YES animated:YES];
    }
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

-(void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    // if the table view is asking to commit a delete command...
    if (editingStyle == UITableViewCellEditingStyleDelete){
        NSArray *items = [[BNRItemStore sharedStore] allItems];
        BNRItem *item = items[indexPath.row];
        [[BNRItemStore sharedStore] removeItem:item];

        // Also remote that row from the table view with an animation
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];

    }
}

-(void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
     toIndexPath:(NSIndexPath *)destinationIndexPath{
    [[BNRItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row
                                        toIndex:destinationIndexPath.row];

}

@end
