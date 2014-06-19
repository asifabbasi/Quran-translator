//
//  DetailViewController.h
//  Quran
//
//  Created by rashid_iMac on 27/09/13.
//  Copyright (c) 2013 rashid_iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate , UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) id detailItem2;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (weak, nonatomic) IBOutlet UITableView *ipadView;
@property (strong,nonatomic) UIBarButtonItem *PlayorPauseButton;
@end
