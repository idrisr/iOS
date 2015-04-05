//  RandomItems
//
//  Created by idris on 3/30/15.
//  Copyright (c) 2015 Idris Raja. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+(instancetype) randomItem{
    // create list of adjectives
    NSArray *adjectives = @[@"Red", @"Big", @"Da Shiz"];
    // create list of nouns
    NSArray *nouns= @[@"Laptop", @"Scooter", @"Idea"];

    // create item name of noun.random + adjective.random
    int nounIndex = arc4random() % [nouns count];
    int adjectiveIndex = arc4random() % [adjectives count];
    NSString *itemName = [NSString stringWithFormat:@"%@ %@", adjectives[adjectiveIndex], nouns[nounIndex]];


    // create 6 digit random Serial Number in the form "A1B3C8"
    NSString * serialNumber = [NSString stringWithFormat:(@"%c%c%c%c%c%c"),
                               arc4random() % 26 + 'A',
                               arc4random() % 10 + '0',
                               arc4random() % 26 + 'A',
                               arc4random() % 10 + '0',
                               arc4random() % 26 + 'A',
                               arc4random() % 10 + '0'];

    // create random int value between 0 and 99
    int value = arc4random() % 100;

    BNRItem * randomItem = [[self alloc]initWithItemName:itemName
                                                    value:value
                                             serialNumber:serialNumber];
    return randomItem;
}


-(instancetype) initWithItemName:(NSString *)name
                           value:(int)value
                    serialNumber:(NSString *)serialNumber{

    // call self's superclass init
    // In the designated initializer, the first thing you always do is
    // call the superclass’s designated initializer using super.

    self = [super init];

    if (self) {
        _valueInDollars = value;
        _name = name;
        _serialNumber = serialNumber;
        _dateCreated = [NSDate date];
    }
    return self;
}

-(instancetype) initWithItemName:(NSString *)name
                    serialNumber:(NSString *)serialNumber{
    return [self initWithItemName:name
                            value:0
                     serialNumber:serialNumber];

}

-(instancetype) initWithItemName:(NSString *)name{
    return [self initWithItemName:name
                            value:0
                     serialNumber:@""];
}

-(instancetype) init{
    return [self initWithItemName:@"Item"];

}

-(NSString *) description{
    NSString *desc = [[NSString alloc]
                      initWithFormat:@"item:%@\t SerialNumber:%@ \tDollarvalue:%i\n",
                                      self.name, self.serialNumber, self.valueInDollars];
    return desc;
}

-(int) count{
    return 1;
}
-(int) fullValue{
    return self.valueInDollars;
}

-(void) dealloc{
    NSLog(@"Destroying: %@", self);
}

@end