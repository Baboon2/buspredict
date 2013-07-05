//
//  BUMasterViewController.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BUDetailViewController;

@interface BUMasterViewController : UITableViewController

@property (strong, nonatomic) BUDetailViewController *detailViewController;

@end
