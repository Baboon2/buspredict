//
//  BUConnectionManager.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/12/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import "BUConnectionManager.h"
#import "BUModelBuilder.h"

NSString *ConnectionManagerError = @"ConnectionManagerError";


@implementation BUConnectionManager

@synthesize url;
@synthesize fetchError;
@synthesize connection;
@synthesize builder;

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

// override in subclass
- (void)receivedJSON:(NSString *)objectNotation
{
    if (self.builder) {
        [self.builder setJSON:objectNotation];
    }
}
@end
