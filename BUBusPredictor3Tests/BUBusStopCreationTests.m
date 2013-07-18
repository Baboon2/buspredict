//
//  BUBusStopCreationTests.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/11/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "OCMock.h"
#import "BUBusStopModel.h"
#import "BUBusStopConnectionManager.h"
#import "BUConnectionManagerDelegate.h"
#import "BUBusStopDataSource.h"
#import "BUBusStopBuilder.h"


@interface BUBusStopCreationTests : SenTestCase {
    NSMutableDictionary *dictForBusStop1;
}
@end

@implementation BUBusStopCreationTests
{
    @private
    BUBusStopConnectionManager *mgr;
}

-(void)setUp
{
    mgr = [[BUBusStopConnectionManager alloc] init];
    dictForBusStop1 = [NSMutableDictionary dictionary];
    [dictForBusStop1 setObject:@"M1" forKey:@"stop_id"];
    [dictForBusStop1 setObject:@"Student Village 2" forKey:@"stop_name"];
    [dictForBusStop1 setObject:@"33 Harry Agganis Way" forKey:@"stop_desc"];
    [dictForBusStop1 setObject:@"42.353151" forKey:@"stop_lat"];
    [dictForBusStop1 setObject:@"-71.11815" forKey:@"stop_lon"];
    [dictForBusStop1 setObject:@"1" forKey:@"direction_id"];
}

-(void)tearDown
{
    mgr = nil;
}

- (void)testNonConformingObjectCannotBeDelegate
{
    STAssertThrows(mgr.delegate = (id <BUConnectionManagerDelegate>) [NSNull null],
                   @"NSNull should not be used as the delegate");
}

- (void)testConformingObjectCannotBeDelegate
{
    id <BUConnectionManagerDelegate> delegate = [OCMockObject mockForProtocol:@protocol(BUConnectionManagerDelegate)];
    STAssertNoThrow(mgr.delegate = delegate,
                    @"object conforming to protocol should be used");
}

- (void)testManagerAcceptsNilAsDelegate
{
    STAssertNoThrow(mgr.delegate = nil,
                    @"It should be acceptable to use nil as an object's delegate");
}

// FIXME
- (void)testAskingForBusStopMeansRequestingData
{
    id mockConnectionMgr = [OCMockObject mockForClass:[BUBusStopConnectionManager class]];
    [[mockConnectionMgr stub] fetchBusStops];
    NSArray __unused *results = [mockConnectionMgr fetchBusStops];
    [mockConnectionMgr verify];
}

- (void)testErrorReturnedToDelegateIsNotErrorNotifiedByConnectionManager
{
    BUBusStopDataSource *ds = [[BUBusStopDataSource alloc] initWithUrlString:@"" key:@"busstop"];
    mgr.delegate = ds;
    NSError *underlyingError = [NSError errorWithDomain:@"Test domain" code:0 userInfo:nil];
    [mgr fetchFailedWithError: underlyingError];
    STAssertFalse(underlyingError == [mgr.delegate fetchError], @"Error should be at the correct level of abstraction");
}

- (void)testErrorReturnedToDelegateDocumentsUnderlayingError
{
    BUBusStopDataSource *ds = [[BUBusStopDataSource alloc] initWithUrlString:@"" key:@"busstop"];
    mgr.delegate = ds;
    NSError *underlyingError = [NSError errorWithDomain:@"Test domain" code:0 userInfo:nil];
    [mgr fetchFailedWithError:underlyingError];
    STAssertEqualObjects([[[mgr.delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey], underlyingError, @"The underlying error should be available to client code");
}

- (void)testBusStopJSONIsPassedToBusStopBuilder
{
    // data source should have a builder object
    BUBusStopBuilder *builder = [[BUBusStopBuilder alloc] init];
    [mgr setBuilder:builder];
    [mgr receivedJSON: @"Fake JSON"];
    STAssertEqualObjects(builder.JSON, @"Fake JSON", @"Downloaded JSON is sent to the builder");
    [mgr setBuilder:nil];
}

- (void)testInstantiateBusStop
{
    BUBusStopModel *busstop = [[BUBusStopModel alloc] initWithDictionary:dictForBusStop1];
    STAssertNotNil(busstop, @"need to instantiate");
}


@end
