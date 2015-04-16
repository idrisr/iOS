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
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    // update model with new date
    // pop this view controller off of the stack

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
