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

@interface BULiveBusDataSourceTests : SenTestCase

@end

@implementation BULiveBusDataSourceTests

- (NSString *)liveBusURL
{
    return @"http://www.bu.edu/bumobile/rpc/bus/livebus.json.php";
}

- (void)testGetURLString
{
    BULiveBusDataSource *ds = [[BULiveBusDataSource alloc] initWithUrlString:@"http://www.bu.edu/bumobile/rpc/bus/livebus.json.php"];
    NSString *expected = @"http://www.bu.edu/bumobile/rpc/bus/livebus.json.php";
    NSString *result = [ds urlString];
    STAssertEqualObjects(expected, result, @"should be able to get url string");
}

- (void)testGetNSURL
{
    BULiveBusDataSource *ds = [[BULiveBusDataSource alloc] initWithUrlString:@"http://www.bu.edu/bumobile/rpc/bus/livebus.json.php"];
    NSURL *expected = [NSURL URLWithString:@"http://www.bu.edu/bumobile/rpc/bus/livebus.json.php"];
    NSURL *result = [ds url];
    STAssertEqualObjects(expected, result, @"should be able to get nsurl");
}

- (void)testInstantiateBus
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"1234567" forKey:@"identifier"];
    [dict setObject:@"71.5" forKey:@"lng"];
    [dict setObject:@"42.1" forKey:@"lat"];
    [dict setObject:@"13" forKey:@"speed"];
    [dict setObject:@"276" forKey:@"heading"];
    [dict setObject:@"2013-07-09T16:42:44-04:00" forKey:@"timestamp"];
    BUBusModel *bus = [[BUBusModel alloc] initWithDictionary:dict];
    STAssertNotNil(bus, @"need to instantiate");
}

@end
