//
//  DetailViewController.m
//  Quran
//
//  Created by rashid_iMac on 27/09/13.
//  Copyright (c) 2013 rashid_iMac. All rights reserved.
//

#import "DetailViewController.h"
#import "CustomeCell.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController
@synthesize tableview;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [self configureView];
       
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}
- (void)setDetailItem2:(id)newDetailItem2
{
    if (_detailItem2 != newDetailItem2) {
        _detailItem2 = newDetailItem2;
        [self configureView];
        
    }
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }

}


- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem2 && _ipadView.window) {
        
        _ipadView.delegate = self;
        _ipadView.dataSource = self;
        [_ipadView reloadData ];
    }
}

- (void)viewDidLoad
{
    
     _PlayorPauseButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:nil];
    self.navigationItem.rightBarButtonItem = _PlayorPauseButton;
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated
{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0]; // set to whatever you want to be selected first
    [tableview selectRowAtIndexPath:indexPath animated:NO  scrollPosition:UITableViewScrollPositionNone];
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark - Table View

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
  //  NSString *text = [self.detailItem objectAtIndex:indexPath.row];
   // UIFont *font = [UIFont systemFontOfSize:14];
  //return [indexPath row]*20;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.detailItem count];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
   // cell.transform = CGAffineTransformMakeScale(0.8, 0.8);
   //NSIndexPath *indexPathcell = [NSIndexPath indexPathForRow:0 inSection:0];
   // cell.highlighted=indexPath.row;
   // [cell setHighlighted:YES animated:YES];
      //  cell.transform = CGAffineTransformIdentity;
    
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Customcell";
    CustomeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
    tableView.separatorColor = [UIColor colorWithRed:0.576 green:0.796 blue:0.008 alpha:1];
    
        cell.contentTextView.text = [_detailItem objectAtIndex:indexPath.row];
      cell.transView.text = [_detailItem2 objectAtIndex:indexPath.row];
    
    
    return cell;
}


@end
