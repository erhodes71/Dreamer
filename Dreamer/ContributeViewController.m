//
//  ContributeViewController.m
//  Dreamer
//
//  Created by Eric Rhodes on 8/9/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "ContributeViewController.h"
#import "CampaignPageViewController.h"

@interface ContributeViewController ()

@end

@implementation ContributeViewController
{
    
    //For waiting for request to finish
    int hold;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Initilize to 0
    hold = 0;
}









//Back button pressed
- (IBAction)backButtonPressed:(id)sender {
    
    [self.view setHidden:true];
    [self.view removeFromSuperview];
    
}







- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - keyboard movements
- (void)keyboardWillShow:(NSNotification *)notification
{
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    
    
    if([_commentTextView isFirstResponder]){
        // Assign new frame to your view
        [UIView animateWithDuration:0.3 animations:^{
            CGRect f = self.view.frame;
            f.origin.y = -keyboardSize.height;
            self.view.frame = f;
        }];
    }
    
    
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = 0.0f;
        self.view.frame = f;
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_amountTextField resignFirstResponder];
    [_percentTextField resignFirstResponder];
    [_commentTextView resignFirstResponder];
}


- (IBAction)goButtonPressed:(id)sender {
    
    //Reset to 0
    hold = 0;
    
    //Send request
    [self sendContributeRequest];
    
    //Wait until the request is done
    while(hold == 0);
    
    //Continue
    [self.view setHidden:true];
    [self.view removeFromSuperview];
    
    
    
}

//Send the request to contribute
-(void)sendContributeRequest
{
    
    //Get information
    NSString* amount = _amountTextField.text;
    NSString* percent = _percentTextField.text;
    NSString* comment = _commentTextView.text;
    comment = [comment stringByReplacingOccurrencesOfString:@" " withString:@"%20"];

    
    //Get user ID
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString* userID = [prefs stringForKey:@"userID"];
    NSLog(@"USER ID: %@",userID);
    
    //Get user ID of person getting investment
    NSString* recieverID = [(CampaignPageViewController*)self.parentViewController getUserID];
    NSLog(@"RECIEVER ID: %@",recieverID);

    
    
    
    //TODO this so that is the correct url
    //This is the origional
    NSString* url = [NSString stringWithFormat:@"http://erhodes.oucreate.com/Dreamer/createContribution.php?amount=%@&percent=%@&comment=%@&receiver=%@&userID=%@",amount,percent,comment,recieverID,userID];
    
    //This is what we want to call
    //erhodes.oucreate.com/Dreamer/loadFeed.php
    //NSString* url = [NSString stringWithFormat:@"http://erhodes.oucreate.com/Dreamer/loadFeed.php"];
    
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        //NSLog(@"requestReply: %@", requestReply);//This works well in getting the data
        
        
        
        //This stops the loop
        self->hold = 1;
        
        //This splits the string into an array seperated by ","
        //self->feedsArray = [requestReply componentsSeparatedByString:@","];
        //self->feedLoaded = 1;
        
        
        
        
        
    }] resume];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
