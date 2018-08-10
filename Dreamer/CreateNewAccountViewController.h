//
//  CreateNewAccountViewController.h
//  Dreamer
//
//  Created by Eric Rhodes on 8/9/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateNewAccountViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameLable;
@property (weak, nonatomic) IBOutlet UITextField *userIDLable;
@property (weak, nonatomic) IBOutlet UITextField *passwordEntery1;
@property (weak, nonatomic) IBOutlet UITextField *passwordEntery2;
@property (weak, nonatomic) IBOutlet UITextField *handle;
@property (weak, nonatomic) IBOutlet UITextField *address;





@end
