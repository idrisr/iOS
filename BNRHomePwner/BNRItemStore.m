//
//  BNRItemStore.m
//  BNRHomePwner
//
//  Created by idris on 4/5/15.
//  Copyright (c) 2015 Idris Raja. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore()
//A class extension is a set of declarations that is private. Only the class or
//instances of the class are able to use the properties, instance variables, or
//methods declared in a class extension.
@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation BNRItemStore

-(BNRItem *) createItem{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

-(NSArray *) allItems{
    return self.privateItems;
}

// here is the real (secret) initializer
-(instancetype) initPrivate{
    self = [super init];
    if (self){
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

+(instancetype) sharedStore{
    static BNRItemStore *sharedStore = nil;

    // Do I need to create a sharedStore?;
    if (!sharedStore){
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

// If a programmer calls [[BNRItem alloc] init], let him know the error of his ways
-(instancetype) init{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BNRItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

-(void) removeItem:(BNRItem *)item{
    [self.privateItems removeObjectIdenticalTo:item];
}


@end
