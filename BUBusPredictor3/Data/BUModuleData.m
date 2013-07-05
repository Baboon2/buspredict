//
//  BUModuleData.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUModuleData.h"

@class BUDataSource;

@implementation BUModuleData
@synthesize dataSources = _dataSources;


//===========================================================
// - (id)init
//
//===========================================================
- (id)init
{
    if ((self = [super init])) {
        _dataSources = [NSMutableArray arrayWithCapacity:8];
    }
    return self;
}

- (void)addSource:(BUDataSource *)dataSource
{
    [self.dataSources addObject:dataSource];
}


- (NSUInteger)countOfDataSources
{
    return [self.dataSources count];
}

@end
