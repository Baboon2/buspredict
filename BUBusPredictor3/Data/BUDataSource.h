//
//  BUDataSource.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BUDataSource : NSObject

@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, copy) NSURL *url;

- (id)initWithUrlString:(NSString*)theUrlString;


@end
