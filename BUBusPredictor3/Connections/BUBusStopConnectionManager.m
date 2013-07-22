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

- (NSArray *)fetchBusStops
{
    NSArray *results = nil;
    if ([self.builder JSON]) {
        results = [self.builder createItemsFromJSON:[self.builder JSON] error:NULL];
    }
    return results;
}

- (void)receivedJSON:(NSString *)objectNotation
{
    [super receivedJSON:objectNotation];
    NSError *error = nil;
    NSArray *items = [self.builder createItemsFromJSON:objectNotation error: &error];
    if ([items count] == 0) {
        NSDictionary *errorInfo = nil;
        if (error) {
            self.fetchError = error;
            errorInfo = [NSDictionary dictionaryWithObject: error forKey:NSUnderlyingErrorKey];
        }
        NSError *reportableError = [NSError errorWithDomain: BusStopConnectionManagerError code: BusStopConnectionManagerErrorFetchCode userInfo: errorInfo];
        [self.delegate fetchingFailedWithError: reportableError];
    }

}
@end
