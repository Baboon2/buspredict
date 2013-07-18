//
//  BUBusStopConnectionManager.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/11/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//
//  This class takes the place of FSNConnection.

#import <Foundation/Foundation.h>
#import "BUConnectionManagerDelegate.h"
#import "BUConnectionManager.h"

extern NSString *BusStopConnectionManagerError;

enum {
    BusStopConnectionManagerErrorFetchCode
};

@interface BUBusStopConnectionManager : BUConnectionManager

- (id)initWithURL:(NSURL *)url;
- (NSArray *)fetchBusStops;

@end
