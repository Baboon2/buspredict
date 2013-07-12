//
//  BUBusPredictor3Tests.m
//  BUBusPredictor3Tests
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//
//  These tests are for the highest-level features of view controller.

#import <SenTestingKit/SenTestingKit.h>
#import "BUBusPredictor3Tests.h"
#import "BUBusPredictorMasterViewController.h"
#import "BusPredictorData.h"
//#import "JSONModel.h"

@interface BUBusPredictor3Tests : SenTestCase

@end

@implementation BUBusPredictor3Tests

- (void)testModuleName
{
    NSString *expected = @"Bus Predictor";
    BusPredictorData *moduleData = [[BusPredictorData alloc] init];
    NSString *result = [moduleData moduleName];
    STAssertEqualObjects(result, expected, @"module name should be correct");
}

- (void)testViewControllerHasModuleData
{
    BUBusPredictorMasterViewController *vc = [[BUBusPredictorMasterViewController alloc] init];
    STAssertNotNil([vc moduleData], @"module must have moduleData");
}

- (void)testViewControllerHasRightKindOfModuleData
{
    BUBusPredictorMasterViewController *vc = [[BUBusPredictorMasterViewController alloc] init];
    STAssertTrue([[[vc moduleData] class] isSubclassOfClass:[BUModuleData class]], @"module data must be subclass of BUModuleData");
}

- (void)testModuleDataHasModel
{
    BusPredictorData *moduleData = [[BusPredictorData alloc] init];
    STAssertNotNil([moduleData busModel], @"module data must have data model");
}

- (void)testModelIsRightClass
{
    BusPredictorData *moduleData = [[BusPredictorData alloc] init];
    STAssertTrue([[[moduleData busModel] class] isSubclassOfClass:[JSONModel class]], @"model must be subclass of JSONModel");
}

- (void)testViewControllerCanAccessModel
{
    BUBusPredictorMasterViewController *vc = [[BUBusPredictorMasterViewController alloc] init];
    STAssertNotNil([[vc moduleData] busModel], @"vc must have access to model");
}


@end
