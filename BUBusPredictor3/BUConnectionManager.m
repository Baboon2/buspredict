//
//  BUConnectionManager.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/12/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUConnectionManager.h"

@implementation BUConnectionManager

- (id)initWithURL:(NSURL *)url
{
    if (self = [super init]) {
        _request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5];
    }
    return self;
}

@end
