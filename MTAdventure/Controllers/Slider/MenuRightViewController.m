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
@synthesize oneDBtn, twoDBtn;

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
    [self dismissViewControllerAnimated:YES completion:^{
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"filterData" object:nil userInfo:[NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:[NSNumber numberWithBool:oneDBtn.selected], [NSNumber numberWithBool:twoDBtn.selected], nil] forKey:@"price"]];
    }];
}

- (IBAction)oneD:(id)sender {
    if (oneDBtn.selected) {
        oneDBtn.selected = NO;
        oneDBtn.backgroundColor = [UIColor colorWithRed:(115/255.0) green:(115/255.0) blue:(115/255.0) alpha:1];
        NSLog(@"hey button not selected");
    }
    else{
        oneDBtn.selected =YES;
        oneDBtn.backgroundColor = [UIColor colorWithRed:(200/255.0) green:(115/255.0) blue:(115/255.0) alpha:1];
        NSLog(@"hey button selected");

    }
}

- (IBAction)twoD:(id)sender {
    if (twoDBtn.selected) {
        twoDBtn.selected = NO;
        twoDBtn.backgroundColor = [UIColor colorWithRed:(115/255.0) green:(115/255.0) blue:(115/255.0) alpha:1];
        NSLog(@"hey button not selected");
    }
    else{
        twoDBtn.selected =YES;
        twoDBtn.backgroundColor = [UIColor colorWithRed:(200/255.0) green:(115/255.0) blue:(115/255.0) alpha:1];
        NSLog(@"hey button selected");
        
    }
}
@end
