//
//  BUBusStopConnectionManagerTests.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/22/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//
// Handles details of the connection.

#import <SenTestingKit/SenTestingKit.h>
#import "BUBusStopConnectionManager.h"
#import "BUBusStopDataSource.h"

@interface BUBusStopConnectionManagerTests : SenTestCase

@end

@implementation BUBusStopConnectionManagerTests {
    @private
    BUBusStopConnectionManager *commMgr;
    BUBusStopDataSource *ds;
}

-(void)setUp
{
    commMgr = [[BUBusStopConnectionManager alloc] initWithURL:[NSURL URLWithString:[self urlForBusStops]]];
    ds = [[BUBusStopDataSource alloc] initWithUrlString:nil key:@"busstop"];
    [commMgr setDelegate:ds];
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
    [commMgr fetchJSONWithErrorHandler:nil successHandler:nil];
    STAssertNotNil([commMgr connection], @"There should be a URL connection now");
    [commMgr cancelURLConnection];
}

- (void)testStartingNewRequestThrowsOutOldConnection
{
    NSArray *stops = [commMgr fetchJSONWithErrorHandler:nil successHandler:nil];
    NSURLConnection *firstConnection = [commMgr connection];
    stops = [commMgr fetchJSONWithErrorHandler:nil successHandler:nil];
    STAssertFalse([[commMgr connection] isEqual:firstConnection], @"The connection mgr needs to replace its url connection for each request");
    [commMgr cancelURLConnection];
}

- (void)testReceivingResponseDiscardsExistingData
{
    commMgr->receivedData = (NSMutableData *)[@"Hello" dataUsingEncoding: NSUTF8StringEncoding];
    [commMgr fetchJSONWithErrorHandler:nil successHandler:nil];
    [commMgr connection: nil didReceiveResponse: nil];
    STAssertEquals([commMgr->receivedData length], (NSUInteger)0, @"Data should have been discarded");
}

- (void)testConnectionFailingPassesErrorToDelegate {
    [commMgr fetchJSONWithErrorHandler:nil successHandler:nil];
    NSError *error = [NSError errorWithDomain:@"Fake Domain" code:ConnectionManagerErrorFetch userInfo:nil];
    [commMgr connection:nil didFailWithError:error];
    STAssertEqualObjects([commMgr.delegate fetchError] , error, @"delegate should be informed of connection error");
}
@end
