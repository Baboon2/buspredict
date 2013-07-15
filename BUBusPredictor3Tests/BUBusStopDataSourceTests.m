//
//  BUBusStopDataSourceTests.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/10/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "BUBusStopDataSource.h"
#import "BUBusStopModel.h"

@interface BUBusStopDataSourceTests : SenTestCase

@end

@implementation BUBusStopDataSourceTests {
    NSMutableDictionary *dictForStop1;
    BUBusStopDataSource *ds;
}

-(void)setUp
{
    ds = [[BUBusStopDataSource alloc] initWithUrlString:[self urlForBusStops] key:@"busstop"];
    dictForStop1 = [NSMutableDictionary dictionary];
    [dictForStop1 setObject:@"" forKey:@"stop_id" ];
}

- (void)tearDown
{
    ds = nil;
    dictForStop1 = nil;
}

- (NSString *)urlForBusStops
{
    return @"http://www.bu.edu/bumobile/rpc/bus/stops.json.php";
}

- (void)testDataSourceHasConnectionMgr
{
    STAssertNotNil([ds connectionManager], @"data source must have connection manager");
}

@end
