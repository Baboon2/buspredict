//
//  BUTableViewControllerTests.m
//  BUBusPredictor3
//
//  Created by Ray Swartz on 8/7/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "BUTableViewController.h"

@interface BUTableViewControllerTests : SenTestCase

@end

@implementation BUTableViewControllerTests {
    BUTableViewController *viewController;
}


- (void)setUp
{
    viewController = [[BUTableViewController alloc] init];
}

- (void)tearDown
{
    viewController = nil;
}



@end
