//
//  BULiveBusDataSourceTests.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/9/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "BULiveBusDataSource.h"

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


@end
