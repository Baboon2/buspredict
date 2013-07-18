//
//  BUModelBuilder.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/18/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BUModelBuilder : NSObject

@property (copy) NSString *JSON;
@property (nonatomic, strong) NSArray *arrayToReturn;
@property (copy) NSError *errorToSet;

- (NSArray *)createItemsFromJSON:(NSString *)stringJSON error:(NSError **)error;

@end
