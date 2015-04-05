//
//  BNRITem.h
//  RandomItems
//
//  Created by idris on 3/30/15.
//  Copyright (c) 2015 Idris Raja. All rights reserved.
//

#import <Foundation/Foundation.h>

// Designated initializer
@interface BNRItem : NSObject{
}

@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate * dateCreated;

+(instancetype)randomItem;

-(instancetype) initWithItemName:(NSString *) name
                           value:(int) value
                    serialNumber:(NSString *)serialNumber;

-(instancetype) initWithItemName:(NSString *) name
                    serialNumber:(NSString *)serialNumber;

-(instancetype) initWithItemName:(NSString *) name;

-(int)count;
-(int)fullValue;

-(BNRItem *) containedItem;
-(BNRItem *) container;
-(void) setContainedItem:(BNRItem *)item;
-(void) setContainer:(BNRItem *)item;

@end