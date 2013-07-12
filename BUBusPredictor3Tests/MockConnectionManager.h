//
//  MockConnectionManager.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/12/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUBusStopConnectionManager.h"

@interface MockConnectionManager : BUBusStopConnectionManager

- (BOOL)wasAskedToFetchBusStops;

@end
