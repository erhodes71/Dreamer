//
//  CreateCampaignViewController.h
//  Dreamer
//
//  Created by Eric Rhodes on 8/1/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateCampaignViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITextField *moneyTextField;

@property (weak, nonatomic) IBOutlet UIButton *profit;
@property (weak, nonatomic) IBOutlet UIButton *charity;

@property (weak, nonatomic) IBOutlet UIView *warningView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;


@end
