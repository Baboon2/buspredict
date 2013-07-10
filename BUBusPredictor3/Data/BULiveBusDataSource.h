//
//  BULiveBusDataSource.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BUDataSource.h"
#import "BULiveBusConnection.h"

@interface BULiveBusDataSource : BUDataSource

@property (nonatomic, readonly, weak) BULiveBusConnection *connection;

@end
