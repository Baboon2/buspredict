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
        _dataSources = [NSMutableDictionary dictionaryWithCapacity:8];
    }
    return self;
}

- (void)addSource:(BUDataSource *)dataSource
{
    [self.dataSources setObject:dataSource forKey:[dataSource key]];
}

- (BUDataSource *)dataSourceForKey:(NSString *)theKey
{
    BUDataSource *ds = nil;
    ds = [self.dataSources objectForKey:theKey];
    return ds;
}

- (NSUInteger)countOfDataSources
{
    return [self.dataSources count];
}


@end
