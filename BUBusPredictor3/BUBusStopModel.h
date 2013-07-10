//
//  BUBusStopModel.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/10/13.
//  readonlyright (c) 2013 Boston University. All rights reserved.
//

#import "JSONModel.h"

@interface BUBusStopModel : JSONModel

@property (nonatomic, readonly) NSString *stop_id;
@property (nonatomic, readonly) NSString *stop_name;
@property (nonatomic, readonly) NSString *stop_desc;
@property (nonatomic, readonly) NSNumber *stop_lat;
@property (nonatomic, readonly) NSNumber *stop_lon;
@property (nonatomic, readonly) NSString *direction_id;

@end
