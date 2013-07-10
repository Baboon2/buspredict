//
//  BULiveBusConnection.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/10/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BULiveBusConnectionManager.h"

@implementation BULiveBusConnectionManager {
    NSURLRequest *request;
}

- (id)initWithURL:(NSURL *)url
{
    if (self = [super init]) {
        request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5];
    }
    return self;
}

@end
