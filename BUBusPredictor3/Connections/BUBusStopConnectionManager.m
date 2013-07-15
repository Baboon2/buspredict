//
//  BUBusStopConnectionManager.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/11/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUBusStopConnectionManager.h"

@implementation BUBusStopConnectionManager

@synthesize delegate;

- (void)setDelegate:(id<BUConnectionManagerDelegate>)newDelegate
{
    if (newDelegate &&
        ![newDelegate conformsToProtocol:@protocol(BUConnectionManagerDelegate)]) {
        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Delegate object does not conform to protocol" userInfo:nil] raise];
    }
    delegate = newDelegate;
}

- (NSArray *)fetchBusStops
{
    return [NSArray array];
}
@end
