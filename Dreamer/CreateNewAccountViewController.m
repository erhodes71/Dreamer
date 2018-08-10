//
//  CreateNewAccountViewController.m
//  Dreamer
//
//  Created by Eric Rhodes on 8/9/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "CreateNewAccountViewController.h"

@interface CreateNewAccountViewController ()

@end

@implementation CreateNewAccountViewController

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
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
