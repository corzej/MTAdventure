//
//  DetailViewController.m
//  MTAdventure
//
//  Created by eungJin on 6/12/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import "DetailViewController.h"
#import "WebMapViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.detailText.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@",[[self dataFromParse] objectForKey:@"title"],[[self dataFromParse] objectForKey:@"description"],[[self dataFromParse] objectForKey:@"address"], [[self dataFromParse] objectForKey:@"website"], [[self dataFromParse] objectForKey:@"Neighborhood"]];
    PFFile *imageFile = [[self dataFromParse] objectForKey:@"Photo"];
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            UIImage *image2 = [UIImage imageWithData:data];
            self.myImg.image = image2;
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)toMap:(id)sender {
   if ( [[UIApplication sharedApplication] canOpenURL:
         [NSURL URLWithString:@"comgooglemaps://"]]) {
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"comgooglemaps://?saddr=Google+Inc,+8th+Avenue,+New+York,+NY&daddr=John+F.+Kennedy+International+Airport,+Van+Wyck+Expressway,+Jamaica,+New+York&directionsmode=transit"]];
   }
   else {
       NSLog(@"google map is not exist");
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.maps.google.com"]];
   }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSLog(@"Source Controller = %@", [segue sourceViewController]);
    NSLog(@"Destination Controller = %@", [segue destinationViewController]);
    NSLog(@"Segue Identifier = %@", [segue identifier]);
    
    if ([segue.identifier isEqualToString:@"myWebView"]) {
        
        WebMapViewController *wVC = [segue destinationViewController];
        wVC.url = [NSURL URLWithString:@"http://www.maps.google.com"]; // replace article.url with your url.
    }
    
}

@end
