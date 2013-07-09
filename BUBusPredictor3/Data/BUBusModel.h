//
//  BUBusPredictorModel.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "JSONModel.h"

@interface BUBusModel : JSONModel

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *timestamp;
@property (nonatomic, copy) NSNumber *heading;
@property (nonatomic, copy) NSNumber *lat;
@property (nonatomic, copy) NSNumber *lng;
@property (nonatomic, copy) NSNumber *speed;

@end
