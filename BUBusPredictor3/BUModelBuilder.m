//
//  BUModelBuilder.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/18/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUModelBuilder.h"

@implementation BUModelBuilder

- (id)init
{
    if ((self = [super init])) {
        self.JSON = @"";
        self.arrayToReturn = [NSArray array];
    }
    return self;
}

// override in subclass
- (NSArray *)createItemsFromJSON:(NSString *)stringJSON error:(NSError **)error
{
    return nil;
}

@end
