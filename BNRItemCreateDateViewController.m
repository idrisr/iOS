//
//  BNRItemCreateDateViewController.m
//  BNRHomePwner
//
//  Created by idris on 4/8/15.
//  Copyright (c) 2015 Idris Raja. All rights reserved.
//

#import "BNRItemCreateDateViewController.h"

@interface BNRItemCreateDateViewController ()

@end

@implementation BNRItemCreateDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)setItemCreateDate:(id)sender{
    NSDate *pickedDate = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", pickedDate);

    // update model with new date
    self.item.dateCreated = pickedDate;

    // pop this view controller off of the stack
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
