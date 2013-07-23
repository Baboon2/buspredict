//
//  BUBusStopConnectionManagerTests.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/22/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "BUBusStopConnectionManager.h"

@interface BUBusStopConnectionManagerTests : SenTestCase

@end

@implementation BUBusStopConnectionManagerTests {
    @private
    BUBusStopConnectionManager *commMgr;
}

-(void)setUp
{
    commMgr = [[BUBusStopConnectionManager alloc] initWithURL:[NSURL URLWithString:[self urlForBusStops]]];

}

- (void)tearDown
{
    commMgr = nil;
}

- (NSString *)urlForBusStops
{
    return @"http://www.bu.edu/bumobile/rpc/bus/stops.json.php";
}

- (void)testFetchBusstopCallsRightWebService
{
    STAssertEqualObjects([[commMgr url] absoluteString], [self urlForBusStops], @"use right url string");
}

- (void)testCreationOfConnection
{
    [commMgr fetchBusStopsWithErrorHandler:nil successHandler:nil];
    STAssertNotNil([commMgr connection], @"There should be a URL connection now");
    [commMgr cancelURLConnection];
}

- (void)testStartingNewRequestThrowsOutOldConnection
{
    NSArray *stops = [commMgr fetchBusStopsWithErrorHandler:nil successHandler:nil];
    NSURLConnection *firstConnection = [commMgr connection];
    stops = [commMgr fetchBusStopsWithErrorHandler:nil successHandler:nil];
    STAssertFalse([[commMgr connection] isEqual:firstConnection], @"The connection mgr needs to replace its url connection for each request");
    [commMgr cancelURLConnection];
}
@end
