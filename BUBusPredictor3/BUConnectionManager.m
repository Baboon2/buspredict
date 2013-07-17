//
//  BUConnectionManager.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/12/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUConnectionManager.h"

NSString *ConnectionManagerError = @"ConnectionManagerError";


@implementation BUConnectionManager

@synthesize url;
@synthesize fetchError;
@synthesize connection;

- (id)initWithURL:(NSURL *)theUrl
{
    if (self = [super init]) {
        _request = [[NSURLRequest alloc] initWithURL:theUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5];
    }
    return self;
}

- (void)fetchFailedWithError:(NSError *)error
{
        NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:error forKey: NSUnderlyingErrorKey];
        NSError *reportableError = [NSError errorWithDomain:ConnectionManagerError  code:ConnectionManagerErrorFetch userInfo:errorInfo];
        [self.delegate fetchingFailedWithError: reportableError];
}
@end
