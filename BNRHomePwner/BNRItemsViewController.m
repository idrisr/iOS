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
@property(nonatomic, retain) UIView *tableFooterView;
@end

@implementation BNRItemsViewController

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Create an instance of UITableViewCell, with default appearance
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];

    // Set the text on the cell with description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview

    // TODO
    // Does this reuse cell objects when old ones go off screen?
    NSArray *items;

    switch (indexPath.section) {
        case 0:
            items = [BNRItemStore.sharedStore allItemsLessThan50];
            break;

        case 1:
            items = [[BNRItemStore sharedStore] allItemsMoreThan50];
            break;

        default:
            items = [[BNRItemStore sharedStore] allItems];
            break;
    }
    // if last section, and last row
    if (indexPath.section == self.tableView.numberOfSections - 1 &&
        indexPath.row == [[[BNRItemStore sharedStore] allItemsMoreThan50] count]){
        cell.textLabel.text = @"Last Row";
    } else{
        BNRItem *item = items[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@\t%i", item.name, item.valueInDollars];
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    switch ((int) section) {
        {case 0:
            return [[[BNRItemStore sharedStore] allItemsLessThan50] count];
            break;
        }
        {case 1:
            return [[[BNRItemStore sharedStore] allItemsMoreThan50] count] + 1;
            break;
        }
        default:
            return [[[BNRItemStore sharedStore] allItems] count];
            break;
    }
}

-(NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger) section {
    switch ((int) section) {
        case 0:
            return @"Items under $50";
            break;
        case 1:
            return @"Items over $50";
            break;

        default:
            return @"Fuck";
            break;
    }
}


-(NSString *)tableView:(UITableView *)tableView
titleForFooterInSection:(NSInteger) section {
    switch ((int) section) {
        case 0:
            return @"The End";
            break;
        case 1:
            return @"My Friend";
            break;

        default:
            return @"Fuck";
            break;
    }
}

-(instancetype) init{
    self = [super initWithStyle:UITableViewStyleGrouped];
    [self.tableView addSubview:self.tableFooterView];

    if (self){
        for (int i = 0; i < 8; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    label.text = @"No More Items!";
    // Colors and font
    label.numberOfLines = 0;
    // Autosize
    [label sizeToFit];
    // Add the UILabel to the tableview
    self.tableView.tableFooterView = label;
    return self;
}

-(instancetype)initWithStyle:(UITableViewStyle)style{
    return [self init];
}

-(void) viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    // Number of sections is the number of regions
    return 2;
}

@end
