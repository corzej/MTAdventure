//
//  InitialViewController.m
//  MTAdventure
//
//  Created by eungJin on 6/12/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import "InitialViewController.h"

@interface InitialViewController () {
}
@property BOOL displayingFront;
@end

@implementation InitialViewController {
}


- (void)viewDidLoad {
    [super viewDidLoad];
//setting toggle button, displayingfront is for which screen come in the front
    self.displayingFront = YES;
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Toggle" style:UIBarButtonItemStylePlain target:self action:@selector(toggleView:)]];
//fliter button for right reveal button
     /*
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(rightMenu)
     forControlEvents:UIControlEventTouchDown];
   
    [button setTitle:@"Filter" forState:UIControlStateNormal];
    NSLog(@"height : %f", self.myContainerView.superview.bounds.size.height);
    button.frame = CGRectMake(0.0, self.myContainerView.superview.bounds.size.height-80.0 , 120.0, 40.0);
    [self.myContainerView addSubview:button];
    */
// Create the GMSMapView with the camera position.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.774042
                                                            longitude:-73.971001                                                                 zoom:13];
    
    self.myMapView.camera = camera;
    self.myMapView.settings.myLocationButton = YES;
    self.myMapView.settings.compassButton = YES;


    
// load data chunck from parse may take time need to fix later

    [self getFromParse];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
/*
    if (![PFUser currentUser]) { // No user logged in
        // Create the log in view controller
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        [logInViewController setDelegate:self]; // Set ourselves as the delegate
        
        // Create the sign up view controller
        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
        
        // Assign our sign up controller to be displayed from the login controller
        [logInViewController setSignUpController:signUpViewController];
        
        // Present the log in view controller
        [self presentViewController:logInViewController animated:YES completion:NULL];
    }
*/
}
#pragma mark - parse methods

- (void) getFromParse {
    //data from parse
    [SVProgressHUD showWithStatus:@"Downloading" maskType:SVProgressHUDMaskTypeBlack];
    PFQuery *query = [PFQuery queryWithClassName:@"Adventure"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
          //  NSLog(@"loging: %@",objects);
            dataChunk = [[NSArray alloc] initWithArray:objects];
            [SVProgressHUD dismiss];
            [self.myTableView reloadData];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}
#pragma mark - toggle
-(void)toggleView:(id)selector {
    [UIView transitionWithView:self.myContainerView
                      duration:1.0
                       options:(self.displayingFront ? UIViewAnimationOptionTransitionFlipFromRight :
                                UIViewAnimationOptionTransitionFlipFromLeft)
                    animations: ^{
                        if(self.displayingFront)
                        {
                            self.myTableView.hidden = true;
                            self.myMapView.hidden = false;
                            [self showMap];
                        }
                        else
                        {
                            self.myTableView.hidden = false;
                            self.myMapView.hidden = true;
                        }
                    }
     
                    completion:^(BOOL finished) {
                        if (finished) {
                            self.displayingFront = !self.displayingFront;
                        }
                    }];

}
- (IBAction)menuBtn:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECRight];
}
/*
- (void)rightMenu{
    //todo thispart
    MenuRightViewController *myNewVC = [[MenuRightViewController alloc] init];
    [self presentViewController:myNewVC animated:YES completion:NULL];

}
*/

/*
#pragma mark - PFLogInViewControllerDelegate
// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length != 0 && password.length != 0) {
        return YES; // Begin login process
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Make sure you fill out all of the information!"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}

// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - PFSignUpViewControllerDelegate

// Sent to the delegate to determine whether the sign up request should be submitted to the server.
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    BOOL informationComplete = YES;
    
    // loop through all of the submitted data
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || field.length == 0) { // check completion
            informationComplete = NO;
            break;
        }
    }
    
    // Display an alert if a field wasn't completed
    if (!informationComplete) {
        [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                    message:@"Make sure you fill out all of the information!"
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
    }
    
    return informationComplete;
}

// Sent to the delegate when a PFUser is signed up.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissModalViewControllerAnimated:YES]; // Dismiss the PFSignUpViewController
}

// Sent to the delegate when the sign up attempt fails.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up...");
}

// Sent to the delegate when the sign up screen is dismissed.
- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    NSLog(@"User dismissed the signUpViewController");
}
*/
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //if I do the next line i am calling the next page twice... need to know why
//    [self performSegueWithIdentifier:@"toDetail" sender:[self.myTableView cellForRowAtIndexPath:indexPath]];
}

#pragma mark - UITableViewDatasourse
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataChunk count];
}

//Warning that I always get confused with tableView variable. It is connected to delegate and datasource that is where you can tell my tableview is this tableView variable
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"mainCell";
    
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[MainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
//try to convert parse object to piece of row
    PFObject *tempObject = [dataChunk objectAtIndex:indexPath.row];
    cell.titleLabel.text = [tempObject objectForKey:@"title"];
    cell.townTrainLabel.text = [NSString stringWithFormat: @"%@, Train: %@", [tempObject objectForKey:@"Neighborhood"],[tempObject objectForKey:@"train"]];
    cell.kindLabel.text = [tempObject objectForKey:@"kind"];
    PFFile *imageFile = [tempObject objectForKey:@"Photo"];
    cell.thumbImg.image =[UIImage imageWithData:[imageFile getData]];

    return cell;

}

#pragma mark - GMSMapViewDelegate


#pragma mark - MapDetails
- (void) showMap {
 //   NSLog(@"1111111: %@",dataChunk);
    for (id ele in dataChunk) {
      //  NSLog(@"tempObjcet: %@",dataChunk);
        
        double tempLat = [[ele objectForKey:@"latitude"] doubleValue];
        double tempLong = [[ele objectForKey:@"longitude"] doubleValue];
        
        CLLocationCoordinate2D position = CLLocationCoordinate2DMake(tempLat, tempLong);
        GMSMarker *marker = [GMSMarker markerWithPosition:position];
        marker.title = [ele objectForKey:@"title"];
        marker.map = self.myMapView;
    }
}

#pragma mark - preapre segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"toDetail"])
    {
        NSIndexPath *indexPath = [self.myTableView indexPathForSelectedRow];
        // Get reference to the destination view controller
        DetailViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        [vc setDataFromParse:[dataChunk objectAtIndex:indexPath.row]];
    }
}
@end
