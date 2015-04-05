//
//  BNRItemStore.h
//  BNRHomePwner
//
//  Created by idris on 4/5/15.
//  Copyright (c) 2015 Idris Raja. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItemStore : NSObject

// Notice this is a class method and prefixed with a + instead of -
+(instancetype) sharedStore;
@end
