//
//  BNRDetailViewController.m
//  BNRHomePwner
//
//  Created by idris on 4/8/15.
//  Copyright (c) 2015 Idris Raja. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItemCreateDateViewController.h"

@interface BNRDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
- (IBAction)openDatePicker:(id)sender;

@end

@implementation BNRDetailViewController

-(void) viewDidLoad{
    [super viewDidLoad];
    self.nameField.text = self.item.name;
    self.valueField.text = [NSString stringWithFormat:@"$%i", self.item.valueInDollars];
    self.serialNumberField.text = self.item.serialNumber;
}

- (IBAction)openDatePicker:(id)sender {
    BNRItemCreateDateViewController *dateViewController = [[BNRItemCreateDateViewController alloc] init];

    // Push it onto the top of the navigation controller's stack
    [self.navigationController pushViewController:dateViewController animated:YES];
}
@end

