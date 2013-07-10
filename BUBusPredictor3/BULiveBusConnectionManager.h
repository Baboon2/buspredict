//
//  BULiveBusConnection.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/10/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BULiveBusConnectionManager : NSObject

@property (nonatomic, readonly, weak) NSURL *url;

@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSURLRequest *request;

- (id)initWithURL:(NSURL *)url;

@end
