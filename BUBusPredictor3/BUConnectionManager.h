//
//  BUConnectionManager.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/12/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BUConnectionManagerDelegate.h"

extern NSString *ConnectionManagerError;

enum {
    ConnectionManagerErrorFetch
};

@class BUModelBuilder;


@interface BUConnectionManager : NSObject

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, readonly, weak) NSURL *url;

@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSURLRequest *request;

@property (weak, nonatomic) id<BUConnectionManagerDelegate> delegate; // should be weak?
@property (strong) NSError *fetchError;
@property (nonatomic, strong) BUModelBuilder *builder;

- (id)initWithURL:(NSURL *)url;
- (void)fetchFailedWithError:(NSError *)error;
- (void)receivedJSON:(NSString *)objectNotation;

@end
