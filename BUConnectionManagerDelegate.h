//
//  BUConnectionManagerDelegate.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/12/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BUConnectionManagerDelegate <NSObject>

@required
- (void)fetchingFailedWithError:(NSError *)error;
- (NSError *)fetchError;
- (void)didReceiveItems: (NSArray *)items;
- (NSArray *)fetchedItems;

@end
