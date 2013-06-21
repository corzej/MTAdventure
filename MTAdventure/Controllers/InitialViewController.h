//
//  InitialViewController.h
//  MTAdventure
//
//  Created by eungJin on 6/12/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SVProgressHUD.h"
#import <GoogleMaps/GoogleMaps.h>
#import <ECSlidingViewController/ECSlidingViewController.h>

@interface InitialViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, UITableViewDataSource, UITableViewDelegate> {

    NSArray *dataChunk;

}

@property (strong, nonatomic) IBOutlet GMSMapView *myMapView;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIView *myContainerView;
- (IBAction)menuBtn:(id)sender;
@end
