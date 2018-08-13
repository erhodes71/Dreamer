//
//  CreateNewAccountViewController.m
//  Dreamer
//
//  Created by Eric Rhodes on 8/9/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "CreateNewAccountViewController.h"
#import "SignInViewController.h"

@interface CreateNewAccountViewController ()

@end

@implementation CreateNewAccountViewController
{
    
    //For sending requests
    int hold;
    
    NSString* token;
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)backButtonPressed:(id)sender {
    
    [self.view setHidden:true];
    [self.view removeFromSuperview];
    
}

//Done button is pressed
//  Send data to server to save the new user
//  Set new data on the device for the user to log in on start of app
- (IBAction)doneButtonPressed:(id)sender {
    
    NSLog(@"Test");
    
    //Check if the passwords are the same
    if([_passwordEntery1.text isEqualToString:_passwordEntery2.text])
    {
        //Send request with information
        [self createNewAccount];
        
        while(hold == 0);
        
        hold = 0;
        
        //Load the views
        //Get rid of this one and the superView
        
        [self setUserDataToSystem];
        
        //Test to see how the thing loads here
        [self.view setHidden:true];
        [self.view removeFromSuperview];
        
        //Finish the initialzation of the view
        [(SignInViewController*)self.parentViewController finishAccountCreation];
        
        
    }else{
        
        NSLog(@"Passwords do not match!");
    }
    
    
    
    
    

    
}

-(void)setUserDataToSystem
{
    
    //Save the data
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    //Save data
    [prefs setObject:_userIDLable.text forKey:@"userID"];
    [prefs setObject:_passwordEntery1.text forKey:@"password"];
    [prefs setObject:token forKey:@"token"];
    [prefs setObject:_nameLable.text forKey:@"name"];

}

//Send request to create a new account
-(void)createNewAccount
{
    //Send request with information
    token = @"";
    
    NSString* name = _nameLable.text;
    name = [name stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSString* userID = _userIDLable.text;
    NSString* handle = _handle.text;
    
    NSString* address = _address.text;
    address = [address stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSString* pass = _passwordEntery2.text;
    
    
    //erhodes.oucreate.com/Dreamer/getAccessToken.php?username=erhodes71&password=Soundwave24
    NSString* url = [NSString stringWithFormat:@"http://erhodes.oucreate.com/Dreamer/createAccount.php?username=%@&password=%@&address=%@&handle=%@&name=%@",userID,pass,address,handle,name];
    
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
    
    
    
    if([_nameLable isFirstResponder]){
        // Assign new frame to your view
        //[self.view setFrame:CGRectMake(0,-110,320,460)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
    }else if([_address isFirstResponder]){
        // Assign new frame to your view
        //[self.view setFrame:CGRectMake(0,-110,320,460)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
        
        [UIView animateWithDuration:0.3 animations:^{
            CGRect f = self.view.frame;
            f.origin.y = -keyboardSize.height;
            self.view.frame = f;
        }];
    }else if([_handle isFirstResponder]){
        // Assign new frame to your view
        //[self.view setFrame:CGRectMake(0,-110,320,460)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
        /*[UIView animateWithDuration:0.3 animations:^{
            CGRect f = self.view.frame;
            f.origin.y = -keyboardSize.height;
            self.view.frame = f;
        }];*/
    }else if([_passwordEntery1 isFirstResponder]){
        // Assign new frame to your view
        //[self.view setFrame:CGRectMake(0,-110,320,460)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
        [UIView animateWithDuration:0.3 animations:^{
            CGRect f = self.view.frame;
            f.origin.y = -keyboardSize.height;
            self.view.frame = f;
        }];
    }else if([_passwordEntery2 isFirstResponder]){
        // Assign new frame to your view
        //[self.view setFrame:CGRectMake(0,-130,320,460)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
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


/*
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    [self.view endEditing:YES];
    return YES;
}


- (void)keyboardDidShow:(NSNotification *)notification
{
    if([_nameLable isFirstResponder]){
    // Assign new frame to your view
    //[self.view setFrame:CGRectMake(0,-110,320,460)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
    }else if([_address isFirstResponder]){
        // Assign new frame to your view
        [self.view setFrame:CGRectMake(0,-110,320,460)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
    }else if([_passwordEntery1 isFirstResponder]){
        // Assign new frame to your view
        [self.view setFrame:CGRectMake(0,-110,320,460)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
    }else if([_passwordEntery2 isFirstResponder]){
        // Assign new frame to your view
        [self.view setFrame:CGRectMake(0,-130,320,460)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
    }
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,0,320,460)];
    
    [self.view setUserInteractionEnabled:true];
}*/

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_nameLable resignFirstResponder];
    [_userIDLable resignFirstResponder];
    [_handle resignFirstResponder];
    [_address resignFirstResponder];
    [_passwordEntery1 resignFirstResponder];
    [_passwordEntery2 resignFirstResponder];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
