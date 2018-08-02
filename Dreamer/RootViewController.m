//
//  RootViewController.m
//  Dreamer
//
//  Created by Eric Rhodes on 7/26/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "RootViewController.h"
#import "mainViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
{
    //Create ViewControllers
    UIViewController* signIn;
    UIViewController* main;
    UIViewController* profile;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //This is how you can manage multiple views on one view controller
    //  This is also how you get the view controller from the storyboard.
    signIn = [self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewController"];
    [self addChildViewController:signIn];//This is to add functionality to it.
    [self.view addSubview:signIn.view];
    
    //Add another view controller "MainViewController"
    main = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    [self addChildViewController:main];
    [self.view addSubview:main.view];
    
    //Add another view controller "ProfileViewController"
    profile = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    [self addChildViewController:profile];
    [self.view addSubview:profile.view];
    
    //Sets the others to hidden
    [profile.view setHidden:true];
    [signIn.view setHidden:true];
    
    //Use this to manage position of views
    //This will bring the button to front
    [self.view bringSubviewToFront:_mainButton];
}

- (IBAction)switchButtonPressed:(id)sender {
    NSLog(@"Switched Views");
    
    //Checks and then switches
    if([main.view isHidden])
    {
        [profile.view setHidden:true];
        [main.view setHidden:false];
        
    }else if([profile.view isHidden])
    {
        [profile.view setHidden:false];
        [main.view setHidden:true];
    }
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
