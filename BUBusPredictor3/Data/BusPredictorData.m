//
//  BusPredictorData.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BusPredictorData.h"
#import "BUBusModel.h"
#import "BUBusStopModel.h"

@implementation BusPredictorData

@synthesize moduleName = _moduleName;
@synthesize busModel = _busModel;
@synthesize stopModel = _stopModel;

//===========================================================
// - (id)init
//
//===========================================================
- (id)init
{
    if ((self = [super init])) {
        _moduleName = @"Bus Predictor";
        _busModel = [[BUBusModel alloc] init];
        _stopModel = [[BUBusStopModel alloc] init];
    }
    return self;
}

@end
