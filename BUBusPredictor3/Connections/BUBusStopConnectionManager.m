//
//  BUBusStopConnectionManager.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/11/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUBusStopConnectionManager.h"
#import "BUBusStopBuilder.h"

NSString *BusStopConnectionManagerError = @"BusStopConnectionManagerError";

@implementation BUBusStopConnectionManager

-(id)initWithURL:(NSURL *)url
{
    if (self = [super initWithURL:url]) {
        self.builder = [[BUBusStopBuilder alloc] init];
    }
    return self;
}


@end
