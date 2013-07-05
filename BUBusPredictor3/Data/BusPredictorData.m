//
//  BusPredictorData.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BusPredictorData.h"

@implementation BusPredictorData

@synthesize moduleName = _moduleName;
@synthesize model = _model;


//===========================================================
// - (id)init
//
//===========================================================
- (id)init
{
    if ((self = [super init])) {
        _moduleName = @"Bus Predictor";
        _model = [[BUBusPredictorModel alloc] init];
    }
    return self;
}

@end
