//
//  BusPredictorData.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BUModuleData.h"
#import "BUBusPredictorModel.h"

@class BULiveBusDataSource;

@interface BusPredictorData : BUModuleData

@property (nonatomic, copy) NSString *moduleName;
@property (nonatomic, strong) BUBusPredictorModel *model;

@end
