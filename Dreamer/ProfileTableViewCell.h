//
//  ProfileTableViewCell.h
//  Dreamer
//
//  Created by Eric Rhodes on 7/24/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *descrip;
@property (weak, nonatomic) IBOutlet UILabel *percentage;
@property (weak, nonatomic) IBOutlet UILabel *number;


@end
