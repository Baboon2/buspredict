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


@implementation BUConnectionManager {
    
    @private
    void (^errorHandler)(NSError *);
    void (^successHandler)(NSString *);
}

@synthesize items = _items;
@synthesize url = _url;
@synthesize fetchError;
@synthesize connection;
@synthesize request = _request;
@synthesize builder;
@synthesize delegate = _delegate;


- (id)initWithURL:(NSURL *)theUrl
{
    if (self = [super init]) {
        _url = theUrl;
        _request = [[NSURLRequest alloc] initWithURL:theUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5];
        _items = nil;
    }
    return self;
}

- (void)setDelegate:(id<BUConnectionManagerDelegate>)newDelegate
{
    if (newDelegate &&
        ![newDelegate conformsToProtocol:@protocol(BUConnectionManagerDelegate)]) {
        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Delegate object does not conform to protocol" userInfo:nil] raise];
    }
    _delegate = newDelegate;
}

- (void)fetchFailedWithError:(NSError *)error
{
    self.fetchError = error;
    NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:error forKey: NSUnderlyingErrorKey];
    NSError *reportableError = [NSError errorWithDomain:ConnectionManagerError  code:ConnectionManagerErrorFetch userInfo:errorInfo];
    [self.delegate fetchingFailedWithError: reportableError];
}

// override in subclass
- (void)receivedJSON:(NSString *)objectNotation
{
    NSError *error = nil;
    self.items = nil;
    if (self.builder) {
        [self.builder setJSON:objectNotation];
        self.items = [self.builder createItemsFromJSON:objectNotation error: &error];
    }
    if (!self.items) {
        [self fetchFailedWithError: error];
    } else {
        [self.delegate didReceiveItems:self.items];
    }
}

#pragma mark - NSURLConnectionDelegate methods

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self fetchFailedWithError:error];
}
- (NSArray *)fetchJSONWithErrorHandler:(void (^)(NSError *))errorBlock successHandler:(void (^)(NSString *))successBlock
{
    NSArray *results = nil;
    self.request = [NSURLRequest requestWithURL:self.url];
    [self.connection cancel];
    self.connection = [NSURLConnection connectionWithRequest:self.request delegate:self];
    if (self.connection) {
        self.receivedData = [NSMutableData data];
    } else {
        // inform connection failed
    }
    
    if ([self.builder JSON] && [[self.builder JSON] length] > 0) {
        results = [self.builder createItemsFromJSON:[self.builder JSON] error:NULL];
    }
    return results;

}

- (void)cancelURLConnection
{
    [self.connection cancel];
    self.connection = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
      [receivedData appendData:data];
}

@end
