//
//  DetailViewController.h
//  MTAdventure
//
//  Created by eungJin on 6/12/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSURL *targetUrl;
@property (weak, nonatomic) IBOutlet UITextView *detailText;
@property (weak, nonatomic) IBOutlet UIImageView *myImg;
@property (strong, nonatomic) PFObject *dataFromParse;
@end
