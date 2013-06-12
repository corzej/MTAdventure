//
//  WebMapViewController.h
//  MTAdventure
//
//  Created by eungJin on 6/12/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebMapViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
@property (strong, nonatomic) NSURL *url;

@end
