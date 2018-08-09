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
#import "ProfileViewController.h"

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
    
    NSString* userID;
    NSString* userName;
    NSString* title;
    NSString* description;
    NSString* percent;
    NSString* number;
    
    if ([self.parentViewController isKindOfClass:[mainViewController class]])
    {
        userID = [(mainViewController*)self.parentViewController getCurrentIndexID];
        
        userName = [(mainViewController*)self.parentViewController getCurrentIndexName];
        
        title = [(mainViewController*)self.parentViewController getCurrentIndexTitle];
        
        description = [(mainViewController*)self.parentViewController getCurrentIndexDescription];
        
        percent = [(mainViewController*)self.parentViewController getCurrentIndexPercent];
        
        number = [(mainViewController*)self.parentViewController getCurrentIndexNumber];
    }else{
        
        userID = [(UserViewOfProfileViewController*)self.parentViewController getCurrentIndexID];
        
        userName = [(UserViewOfProfileViewController*)self.parentViewController getCurrentIndexName];
        
        title = [(UserViewOfProfileViewController*)self.parentViewController getCurrentIndexTitle];
        
        description = [(UserViewOfProfileViewController*)self.parentViewController getCurrentIndexDescription];
        
        percent = [(UserViewOfProfileViewController*)self.parentViewController getCurrentIndexPercent];
        
        number = [(UserViewOfProfileViewController*)self.parentViewController getCurrentIndexNumber];
    }
    
    
    
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
    
    if ([self.parentViewController isKindOfClass:[mainViewController class]])
    {
        [(mainViewController*)self.parentViewController showRootViewButtons];
    }else{
    
        [(ProfileViewController*)self.parentViewController showRootViewButtons];
    }
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
