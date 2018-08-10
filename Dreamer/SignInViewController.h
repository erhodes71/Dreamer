//
//  SignInViewController.h
//  Dreamer
//
//  Created by Eric Rhodes on 8/9/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignInViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


-(void)finishAccountCreation;



@end
