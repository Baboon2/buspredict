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


@interface BUConnectionManager : NSObject

@property (nonatomic, readonly, weak) NSURL *url;

@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSURLRequest *request;

@property (weak, nonatomic) id<BUConnectionManagerDelegate> delegate;
@property (strong) NSError *fetchError;

- (id)initWithURL:(NSURL *)url;
- (void)fetchFailedWithError:(NSError *)error;

@end
