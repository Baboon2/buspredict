//
//  BUModuleData.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BUDataSource.h"

@interface BUModuleData : NSObject

@property (nonatomic, strong) NSMutableDictionary *dataSources;

- (void)addSource:(BUDataSource *)dataSource;
- (BUDataSource *)dataSourceForKey:(NSString *)theKey;
- (NSUInteger)countOfDataSources;

@end
