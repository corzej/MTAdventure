//
//  MainCell.h
//  MTAdventure
//
//  Created by eungJin on 6/27/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *townTrainLabel;
@property (weak, nonatomic) IBOutlet UILabel *kindLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@end
