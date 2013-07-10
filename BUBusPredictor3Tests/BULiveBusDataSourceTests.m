//
//  BULiveBusDataSourceTests.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/9/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "BULiveBusDataSource.h"
#import "BUBusModel.h"
#import "BULiveBusConnection.h"

@interface BULiveBusDataSourceTests : SenTestCase

@end

@implementation BULiveBusDataSourceTests {
    NSMutableDictionary *dictForBus1;
    BULiveBusDataSource *ds;
}

- (NSString *)liveBusURL
{
    return @"http://www.bu.edu/bumobile/rpc/bus/livebus.json.php";
}


-(void)setUp
{
    ds = [[BULiveBusDataSource alloc] initWithUrlString:[self liveBusURL]];

    dictForBus1 = [NSMutableDictionary dictionary];
    [dictForBus1 setObject:@"1234567" forKey:@"identifier"];
    [dictForBus1 setObject:@"71.5" forKey:@"lng"];
    [dictForBus1 setObject:@"42.1" forKey:@"lat"];
    [dictForBus1 setObject:@"13" forKey:@"speed"];
    [dictForBus1 setObject:@"276" forKey:@"heading"];
    [dictForBus1 setObject:@"2013-07-09T16:42:44-04:00" forKey:@"timestamp"];

}

-(void)tearDown
{
    ds = nil;
    dictForBus1 = nil;
}

- (void)testGetURLString
{
    NSString *expected = [self liveBusURL];
    NSString *result = [ds urlString];
    STAssertEqualObjects(expected, result, @"should be able to get url string");
}

- (void)testGetNSURL
{
    NSURL *expected = [NSURL URLWithString:@"http://www.bu.edu/bumobile/rpc/bus/livebus.json.php"];
    NSURL *result = [ds url];
    STAssertEqualObjects(expected, result, @"should be able to get nsurl");
}

- (void)testInstantiateBus
{
    BUBusModel *bus = [[BUBusModel alloc] initWithDictionary:dictForBus1];
    STAssertNotNil(bus, @"need to instantiate");
}

- (void)testDataSourceHasConnectionObject
{
    STAssertNotNil([ds liveBusConnection], @"data source needs a connection object");
}

@end
