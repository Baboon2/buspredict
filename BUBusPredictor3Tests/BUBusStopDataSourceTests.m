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
    NSMutableDictionary *dictForBusStop1;
}

-(void)setUp
{
    dictForBusStop1 = [NSMutableDictionary dictionary];
    [dictForBusStop1 setObject:@"M1" forKey:@"stop_id"];
    [dictForBusStop1 setObject:@"Student Village 2" forKey:@"stop_name"];
    [dictForBusStop1 setObject:@"33 Harry Agganis Way" forKey:@"stop_desc"];
    [dictForBusStop1 setObject:@"42.353151" forKey:@"stop_lat"];
    [dictForBusStop1 setObject:@"-71.11815" forKey:@"stop_lon"];
    [dictForBusStop1 setObject:@"1" forKey:@"direction_id"];
}

- (NSString *)urlForBusStops
{
    return @"http://www.bu.edu/bumobile/rpc/bus/stops.json.php";
}

- (void)testInstantiateBusStop
{
    BUBusStopModel *busstop = [[BUBusStopModel alloc] initWithDictionary:dictForBusStop1];
    STAssertNotNil(busstop, @"need to instantiate");
}


@end
