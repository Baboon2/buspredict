//
//  BUConnectionManager.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/12/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUConnectionManager.h"

@implementation BUConnectionManager

@synthesize url;

- (id)initWithURL:(NSURL *)theUrl
{
    if (self = [super init]) {
        _request = [[NSURLRequest alloc] initWithURL:theUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5];
    }
    return self;
}

@end
