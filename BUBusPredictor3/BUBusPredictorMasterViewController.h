//
//  BUMasterViewController.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BUDetailViewController;
@class BusPredictorData;

@interface BUBusPredictorMasterViewController : UITableViewController

@property (strong, nonatomic) BUDetailViewController *detailViewController;
@property (nonatomic, strong) BusPredictorData *moduleData;

@end
