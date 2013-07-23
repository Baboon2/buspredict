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

- (NSArray *)fetchBusStopsWithErrorHandler:(void (^)(NSError *))errorBlock successHandler:(void (^)(NSString *))successBlock
{
    NSArray *results = nil;
    self.request = [NSURLRequest requestWithURL:self.url];
    [self.connection cancel];
    self.connection = [NSURLConnection connectionWithRequest:self.request delegate:self];
    
    
    if ([self.builder JSON] && [[self.builder JSON] length] > 0) {
        results = [self.builder createItemsFromJSON:[self.builder JSON] error:NULL];
    }
    return results;

}

- (void)cancelURLConnection
{
    [self.connection cancel];
    self.connection = nil;
}
@end
