//
//  MenuRightViewController.m
//  MTAdventure
//
//  Created by eungJin on 6/14/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import "MenuRightViewController.h"

@interface MenuRightViewController ()


@end

@implementation MenuRightViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)dismissBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
