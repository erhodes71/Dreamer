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
    
    
    int hold;
    
    NSString* token;

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Set to 0 for request
    hold = 0;
    
    token = @"";
    
    
}


//If sign in button was pressed
- (IBAction)signInButtonPressed:(id)sender {
    
    //Send Request

    
    //For later
    //NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    //Save data
    //[prefs setObject:@"TextToSave" forKey:@"keyToFindText"];
    
    //Probably dont need to use this
    //Get the user information
    //NSString *userID = [prefs stringForKey:@"userID"];
    //NSString *password = [prefs stringForKey:@"password"];
    //NSString *token = [prefs stringForKey:@"token"];
    
    //Set hold to 0
    hold = 0;
    
    //Get the info from entered
    NSString* username = _userNameTextField.text;
    NSString* password = _passwordTextField.text;
    
    //Send the request
    [self getToken:username :password];
    
    
    while(hold == 0);
    
    NSLog(@"Token: %@", token);

    
    //Makes sure that the value is right
    //      TODO: Might need to change to another testing string
    if(![token isEqualToString:@"This is not a current user."])
    {
        //Save the data
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        //Save data
        [prefs setObject:username forKey:@"userID"];
        [prefs setObject:password forKey:@"password"];
        [prefs setObject:token forKey:@"token"];
        
        
        
        //Test to see how the thing loads here
        [self.view setHidden:true];
        [self.view removeFromSuperview];
        
        //Finish the initialzation of the view
        [(RootViewController*)self.parentViewController finishInitialization];
        
    }else{
        
        //Don't do anything.
        //Needs to sign in with right account or create a new one
        NSLog(@"Needs to sign in with right account or create a new one");
        
    }
    

    
}

-(void)finishAccountCreation
{
    //Test to see how the thing loads here
    [self.view setHidden:true];
    [self.view removeFromSuperview];
    
    //Finish the initialzation of the view
    [(RootViewController*)self.parentViewController finishInitialization];
}

//This gets the token from the request
-(void)getToken: (NSString*)userName : (NSString*)password
{
    //This is the origional
    
    token = @"";
    
    
    //erhodes.oucreate.com/Dreamer/getAccessToken.php?username=erhodes71&password=Soundwave24
    NSString* url = [NSString stringWithFormat:@"http://erhodes.oucreate.com/Dreamer/getAccessToken.php?username=%@&password=%@",userName,password];
    
    //This is what we want to call
    //erhodes.oucreate.com/Dreamer/loadFeed.php
    //NSString* url = [NSString stringWithFormat:@"http://erhodes.oucreate.com/Dreamer/loadFeed.php"];
    
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        NSLog(@"requestReply: %@", requestReply);//This works well in getting the data
        
        self->token = requestReply;

        
        //This stops the loop
        self->hold = 1;
        
        
        
        
        
        
    }] resume];
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


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];

}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
