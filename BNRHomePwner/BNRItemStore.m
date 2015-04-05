//
//  BNRItemStore.m
//  BNRHomePwner
//
//  Created by idris on 4/5/15.
//  Copyright (c) 2015 Idris Raja. All rights reserved.
//

#import "BNRItemStore.h"

@implementation BNRItemStore

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

// here is the real (secret) initializer
-(instancetype) initPrivate{
    self = [super init];
    return self;
}

@end
