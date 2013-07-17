//
//  BUDataSource.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BUConnectionManagerDelegate.h"


@class BUConnectionManager;

@interface BUDataSource : NSObject <BUConnectionManagerDelegate>

@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, copy) NSURL *url;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, strong) BUConnectionManager *connectionManager;
@property (strong) NSError *fetchError;

- (id)initWithUrlString:(NSString*)theUrlString key:(NSString *)theKey;


@end
