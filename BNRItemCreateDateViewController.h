//
//  BNRItemCreateDateViewController.h
//  BNRHomePwner
//
//  Created by idris on 4/8/15.
//  Copyright (c) 2015 Idris Raja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRItem.h"

@interface BNRItemCreateDateViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (nonatomic) BNRItem *item;
@end
