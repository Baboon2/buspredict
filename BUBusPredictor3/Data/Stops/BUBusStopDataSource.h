//
//  BUBusStopDataSource.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/8/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUDataSource.h"
#import "BUBusStopConnectionManager.h"

@interface BUBusStopDataSource : BUDataSource

@property (nonatomic, strong) BUBusStopConnectionManager *connectionManager;

@end
