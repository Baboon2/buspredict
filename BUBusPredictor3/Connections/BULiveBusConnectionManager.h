//
//  BULiveBusConnection.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/10/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BUConnectionManager.h"

extern NSString *LiveBusConnectionManagerError;

enum {
    LiveBusConnectionManagerErrorFetchCode = 901
};

@interface BULiveBusConnectionManager : BUConnectionManager

- (NSArray *)fetchBuses;

@end
