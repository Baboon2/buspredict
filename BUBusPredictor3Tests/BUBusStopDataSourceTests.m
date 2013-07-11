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

}

-(void)setUp
{
}

- (NSString *)urlForBusStops
{
    return @"http://www.bu.edu/bumobile/rpc/bus/stops.json.php";
}


@end
