//
//  BUBusPredictorDataTests.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUBusPredictorDataTests.h"
#import "BusPredictorData.h"
#import "BULiveBusDataSource.h"
#import "JSONModel.h"

@implementation BUBusPredictorDataTests
- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (NSString *)liveBusURL
{
    return @"http://www.bu.edu/bumobile/rpc/bus/livebus.json.php";
}

- (NSString *)busStopURL
{
    return @"http://www.bu.edu/bumobile/rpc/bus/stops.json.php";
}

- (void)testAddOneDataSource
{
    BusPredictorData *moduleData = [[BusPredictorData alloc] init];
    BULiveBusDataSource *ds = [[BULiveBusDataSource alloc] initWithUrlString:[self liveBusURL]];
    STAssertNoThrow([moduleData addSource:ds], @"should be able to add one data source to module data");
    STAssertTrue([[[[moduleData dataSources] objectAtIndex:0] class] isSubclassOfClass:[BULiveBusDataSource class]], @"data source should be identifiable");
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}


@end
