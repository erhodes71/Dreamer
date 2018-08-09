//
//  RootViewController.m
//  Dreamer
//
//  Created by Eric Rhodes on 7/26/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "RootViewController.h"
#import "mainViewController.h"
#import "CreateCampaignViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
{
    //Create ViewControllers
    UIViewController* signIn;
    UIViewController* main;
    UIViewController* profile;
    
    UIViewController* createNewCampaignViewController;
    UIViewController* portfolioViewController;
    
    UIViewController* campaignPageViewController;
    
    
    UIViewController* extraViewController;
    
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
    
    [_portfolioButton setHidden:true];
    
    //Use this to manage position of views
    //This will bring the button to front
    [self.view bringSubviewToFront:_mainButton];
    [self.view bringSubviewToFront:_globeButton];
    [self.view bringSubviewToFront:_portfolioButton];

}



- (IBAction)switchButtonPressed:(id)sender {
    NSLog(@"Switched Views");
    
    //Checks and then switches
    if([main.view isHidden])
    {
        [profile.view setHidden:true];
        [main.view setHidden:false];
        [_globeButton setHidden:false];
        [_portfolioButton setHidden:true];

        
    }else if([profile.view isHidden])
    {
        [profile.view setHidden:false];
        [main.view setHidden:true];
        [_globeButton setHidden:true];
        [_portfolioButton setHidden:false];

    }
    
    
}

- (IBAction)globeButtonPressed:(id)sender {
    
    //This will grab a viewController
    
    //This is the one that is going to be used
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ExternalContent_Location_1" bundle:nil];
    
    createNewCampaignViewController = [storyboard instantiateViewControllerWithIdentifier:@"CreateCampaignViewController"];
    [self addChildViewController:createNewCampaignViewController];
    [self.view addSubview:createNewCampaignViewController.view];
    
    
    //This is for a test
    /*UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ExternalContent_Location_1" bundle:nil];
    
    campaignPageViewController = [storyboard instantiateViewControllerWithIdentifier:@"CampaignPageViewController"];
    [self addChildViewController:campaignPageViewController];
    [self.view addSubview:campaignPageViewController.view];*/
    
    //[self.view bringSubviewToFront:createNewCampaignViewController.view];
    
    /*createNewCampaignViewController = [[[NSBundle mainBundle] loadNibNamed:@"CreateCampaignViewController" owner:self options:nil] objectAtIndex:0];
     //[self addChildViewController:createNewCampaignViewController];
     [self.view addSubview:createNewCampaignViewController];*/
}

//
- (IBAction)portfolioButtonPressed:(id)sender {
    
    //This will grab a viewController
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    portfolioViewController = [storyboard instantiateViewControllerWithIdentifier:@"PortfolioViewController"];
    [self addChildViewController:portfolioViewController];
    [self.view addSubview:portfolioViewController.view];
    
    
}

//Brings back the buttons
-(void)bringBackButtons_side2
{
    [_portfolioButton setHidden:false];
    [_mainButton setHidden:false];
    
}

//Hides the buttons
-(void)hideButtons_side2
{
    [_portfolioButton setHidden:true];
    [_mainButton setHidden:true];
    
}


//Brings back the buttons
-(void)bringBackButtons_side1
{
    [_globeButton setHidden:false];
    [_mainButton setHidden:false];
    
}

//Hides the buttons
-(void)hideButtons_side1
{
    [_globeButton setHidden:true];
    [_mainButton setHidden:true];
    
}

-(void)sendToOtherViewController
{
    /*UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ExternalContent_Location_1" bundle:nil];
    
    extraViewController = [storyboard instantiateViewControllerWithIdentifier:@"CampaignPageViewController"];
    [self addChildViewController:extraViewController];
    [self.view addSubview:extraViewController.view];
    */
    
    NSLog(@"THIS IS A TEST");
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
