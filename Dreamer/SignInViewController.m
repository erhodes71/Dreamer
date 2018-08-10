//
//  SignInViewController.m
//  Dreamer
//
//  Created by Eric Rhodes on 8/9/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "SignInViewController.h"
#import "ProfileViewController.h"
#import "RootViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController
{
    
    UIViewController* createAccountViewController;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


//If sign in button was pressed
- (IBAction)signInButtonPressed:(id)sender {
    
    //Send Request
    
    
    //Test to see how the thing loads here
    [self.view setHidden:true];
    [self.view removeFromSuperview];
    
    //Finish the initialzation of the view
    [(RootViewController*)self.parentViewController finishInitialization];

    
}

- (IBAction)backButtonPressed:(id)sender {
    
    [self.view setHidden:true];
    [self.view removeFromSuperview];
    
    [(ProfileViewController*)self.parentViewController showRootViewButtons];
    
}

//If Create New Account Button Was pressed
- (IBAction)createNewAccountButtonPressed:(id)sender {
    
    //Add subview for the creation of the account
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    createAccountViewController = [storyboard instantiateViewControllerWithIdentifier:@"CreateNewAccountViewController"];
    [self addChildViewController:createAccountViewController];
    [self.view addSubview:createAccountViewController.view];
    
    
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
