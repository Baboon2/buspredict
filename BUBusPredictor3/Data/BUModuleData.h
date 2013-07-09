//
//  BUModuleData.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BUDataSource;

@interface BUModuleData : NSObject

@property (nonatomic, strong) NSMutableArray *dataSources;

- (void)addSource:(BUDataSource *)dataSource;
- (NSUInteger)countOfDataSources;

@end
