//
//  BusPredictorData.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//
//  

#import <UIKit/UIKit.h>
#import "BUModuleData.h"
#import "BULiveBusDataSource.h"
#import "BUBusModel.h"
#import "BUBusStopModel.h"

@interface BusPredictorData : BUModuleData

@property (nonatomic, copy) NSString *moduleName;
@property (nonatomic, strong) BUBusModel *busModel;
@property (nonatomic, strong) BUBusStopModel *stopModel;

@end
