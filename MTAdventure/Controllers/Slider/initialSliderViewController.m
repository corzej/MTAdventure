//
//  initialSliderViewController.m
//  MTAdventure
//
//  Created by eungJin on 6/13/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import "initialSliderViewController.h"

@interface initialSliderViewController ()

@end

@implementation initialSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//set storyboard depends on the type of devices
    UIStoryboard *storyboard;
    if (UI_USER_INTERFACE_IDIOM() ==UIUserInterfaceIdiomPhone) {
        storyboard = [UIStoryboard storyboardWithName:@"iPhone" bundle:nil];
    }
//set the topview of the SliderViewController
    self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"mainView"];
}

@end
