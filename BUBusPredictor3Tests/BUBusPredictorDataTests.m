//
//  BUBusPredictorDataTests.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

// #import "BUBusPredictorDataTests.h"
#import "BusPredictorData.h"
#import "BULiveBusDataSource.h"
#import "BUBusStopDataSource.h"
#import "JSONModel.h"

@interface BUBusPredictorDataTests : SenTestCase 
    @property (strong, nonatomic)    BusPredictorData *moduleData;

@end

@implementation BUBusPredictorDataTests
- (void)setUp
{
    [super setUp];
    
    self.moduleData = [[BusPredictorData alloc] init];
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
    BULiveBusDataSource *ds = [[BULiveBusDataSource alloc] initWithUrlString:[self liveBusURL] key:@"livebus"];
    STAssertNoThrow([self.moduleData addSource:ds], @"should be able to add one data source to module data");
    STAssertTrue([[[[self.moduleData dataSources] objectForKey:@"livebus"] class] isSubclassOfClass:[BULiveBusDataSource class]], @"data source should be identifiable");
}

- (void)testAddSecondDataSource
{
    BULiveBusDataSource *ds = [[BULiveBusDataSource alloc] initWithUrlString:[self liveBusURL] key:@"livebus"];
    [self.moduleData addSource:ds];
    BUBusStopDataSource *bsds = [[BUBusStopDataSource alloc] initWithUrlString:[self busStopURL] key:@"busstop"];
    STAssertNoThrow([self.moduleData addSource:bsds], @"should be able to add two data sources to module data");
    STAssertTrue([[[[self.moduleData dataSources] objectForKey:@"busstop"] class] isSubclassOfClass:[BUBusStopDataSource class]], @"data source should be identifiable");
    STAssertTrue([self.moduleData countOfDataSources] == 2, @"the count of data sources should be correct");
}

- (void)tearDown
{
    self.moduleData = nil;
    
    [super tearDown];
}


@end
