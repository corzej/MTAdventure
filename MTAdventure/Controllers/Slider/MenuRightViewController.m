//
//  MenuRightViewController.m
//  MTAdventure
//
//  Created by eungJin on 6/14/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import "MenuRightViewController.h"

@interface MenuRightViewController ()

@property (nonatomic, assign) CGFloat peekLeftAmount;

@end

@implementation MenuRightViewController
@synthesize peekLeftAmount;

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
    //ECslider
    self.peekLeftAmount = 40.0f;
    [self.slidingViewController setAnchorLeftPeekAmount:self.peekLeftAmount];
    self.slidingViewController.underRightWidthLayout = ECVariableRevealWidth;
}


@end
