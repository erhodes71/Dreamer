//
//  CampaignPageViewController.m
//  Dreamer
//
//  Created by Eric Rhodes on 8/8/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "CampaignPageViewController.h"
#import "mainViewController.h"
#import "UserViewOfProfileViewController.h"

@interface CampaignPageViewController ()

@end

@implementation CampaignPageViewController
{
    UIViewController* userViewOfProfileViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    //Load the data of the user selected
    //This information can be done through the previous view
    NSString* userID = [(mainViewController*)self.parentViewController getCurrentIndexID];
    
    NSString* userName = [(mainViewController*)self.parentViewController getCurrentIndexName];
    
    NSString* title = [(mainViewController*)self.parentViewController getCurrentIndexTitle];
    
    NSString* description = [(mainViewController*)self.parentViewController getCurrentIndexDescription];
    
    NSString* percent = [(mainViewController*)self.parentViewController getCurrentIndexPercent];
    
    NSString* number = [(mainViewController*)self.parentViewController getCurrentIndexNumber];
    
    NSLog(@"%@", userID);
    NSLog(@"%@", userName);
    NSLog(@"%@", title);
    NSLog(@"%@", description);
    NSLog(@"%@", percent);
    NSLog(@"%@", number);
    
    //Sets the values
    _titleLable.text = title;
    _descriptionTextView.text = description;
    _nameLable.text = userName;
    _userNameLable.text = userID;
    _percentLable.text = percent;
    _fundsLable.text = number;
    
    
}

//Image of user is pressed
- (IBAction)profileButtonPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ExternalContent_Location_1" bundle:nil];
    
    userViewOfProfileViewController = [storyboard instantiateViewControllerWithIdentifier:@"UserViewOfProfileViewController"];
    [self addChildViewController:userViewOfProfileViewController];
    [self.view addSubview:userViewOfProfileViewController.view];
    
}






//Contribute button is pressed
- (IBAction)contributeButtonPressed:(id)sender {
    //Takes you to a page to 
    
}






- (IBAction)backButtonPressed:(id)sender {
    
    
    [self.view setHidden:true];
    [self.view removeFromSuperview];
    [(mainViewController*)self.parentViewController showRootViewButtons];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
