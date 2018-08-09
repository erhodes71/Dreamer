//
//  CampaignPageViewController.h
//  Dreamer
//
//  Created by Eric Rhodes on 8/8/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CampaignPageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@property (weak, nonatomic) IBOutlet UILabel *userNameLable;

@property (weak, nonatomic) IBOutlet UILabel *percentLable;

@property (weak, nonatomic) IBOutlet UILabel *fundsLable;


@end
