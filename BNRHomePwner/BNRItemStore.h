//
//  BNRItemStore.h
//  BNRHomePwner
//
//  Created by idris on 4/5/15.
//  Copyright (c) 2015 Idris Raja. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject
@property (nonatomic, readonly) NSArray *allItems;

// Notice this is a class method and prefixed with a + instead of -
+(instancetype) sharedStore;
- (BNRItem *) createItem;
- (void)removeItem:(BNRItem *) item;
@end
