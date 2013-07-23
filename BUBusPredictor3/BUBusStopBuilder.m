//
//  BUBusStopBuilder.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/18/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUBusStopBuilder.h"

@implementation BUBusStopBuilder


//===========================================================
// - (id)init
//
//===========================================================
- (id)init
{
    if ((self = [super init])) {
    }
    return self;
}


- (NSArray *)createItemsFromJSON:(NSString *)stringJSON error:(NSError **)error
{
    self.JSON = stringJSON;
    if (error) {
        *error = [NSError errorWithDomain:@"" code:714 userInfo:nil];
    }
    return self.arrayToReturn;
}

@end
