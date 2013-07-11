//
//  BUBusStopCreationTests.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/11/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "BUBusStopModel.h"
#import "BUBusStopConnectionManager.h"

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

- (void)testNonConformingObjectCannotBeDelegate
{
    STAssertThrows(mgr.delegate = (id <BUBusStopConnectionManagerDelegate>) [NSNull null],
                   @"NSNull should not be used as the delegate");
}

- (void)testConformingObjectCannotBeDelegate
{
    id <BUBusStopConnectionManagerDelegate> delegate =
    [[MockBusStopConnectionManagerDelegate alloc] init];
    STAssertNoThrow(mgr.delegate = delegate,
                    @"object conforming to protocol should be used");
}

-(void)tearDown
{
    mgr = nil;
}

- (void)testInstantiateBusStop
{
    BUBusStopModel *busstop = [[BUBusStopModel alloc] initWithDictionary:dictForBusStop1];
    STAssertNotNil(busstop, @"need to instantiate");
}


@end
