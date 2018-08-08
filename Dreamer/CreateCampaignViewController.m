//
//  CreateCampaignViewController.m
//  Dreamer
//
//  Created by Eric Rhodes on 8/1/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "CreateCampaignViewController.h"

@interface CreateCampaignViewController ()

@end

@implementation CreateCampaignViewController
{
    
    int hold;
    NSString* value;
    bool readyToSubmit;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //Sets the hold to 0
    hold = 0;
    value = @"none";
    readyToSubmit = false;
    [_spinner setHidden:true];
    
}

//Checks if its okay to submit
-(void)checkIfReadyToSubmit
{
    if(![_titleTextField.text isEqualToString:@""])
    {
        if(![_descriptionTextView.text isEqualToString:@""])
        {
            if(![_moneyTextField.text isEqualToString:@""])
            {
                if(![value isEqualToString:@"none"])
                {
                    readyToSubmit = true;
                }
            }
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Returns user to the main screen
- (IBAction)backButtonPressed:(id)sender {
    
    [self.view setHidden:true];
}





//Changes the value to Cash
- (IBAction)profitButtonPressed:(id)sender {
    value = @"Cash";
    _profit.highlighted = true;
    _charity.highlighted = false;
    NSLog(@"%@",value);

}

//Changes the value to Charity
- (IBAction)charityButtonPressed:(id)sender {
    value = @"Charity";
    _profit.highlighted = false;
    _charity.highlighted = true;
    NSLog(@"%@",value);
}




- (IBAction)goButtonPressed:(id)sender {
    
    NSLog(@"Go button pressed!");
    
    [self checkIfReadyToSubmit];
    
    if(readyToSubmit){
        
        //Adds the campaign
        [self addCampaign];
        
        //Wait til its finished loading
        while(hold == 0);
        
        //Starts the spinner
        [_spinner stopAnimating];
        [_spinner setHidden:true];
        
        
        
        //If it needs to go again
        hold = 0;
        
        
        //Move the file out of the way.
        [self.view setHidden:true];
        
    }else{
        
        [_warningView setHidden:false];
        
    }
}

//Add the campaign
-(void)addCampaign
{
    
    if(readyToSubmit){
        
        //Starts the spinner
        [_spinner setHidden:false];
        [_spinner startAnimating];
        
        //TODO: Make loaded data
        //Make these values static for the moment
        NSString* userName = @"Eric Rhodes";
        userName = [userName stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        NSString* userID = @"eric2";
        
        NSString* title = _titleTextField.text;
        title = [title stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        NSString* descript = _descriptionTextView.text;
        descript = [descript stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        NSString* money = _moneyTextField.text;
        
        
        //This is the url to send for the request
        NSString* url = [NSString stringWithFormat:@"http://erhodes.oucreate.com/Dreamer/createNewCampaign.php?name=%@&id=%@&title=%@&descript=%@&money=%@&value=%@",userName,userID,title,descript,money,value];
        
        NSString* url2 = [NSString stringWithFormat:@"http://erhodes.oucreate.com/Dreamer/createNewCampaign.php"];
        NSLog(@"url: %@", url);
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"GET"];
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"requestReply: %@", requestReply);//This works well in getting the data
            
            //Convert the data to a managable format
            /*NSData* jsonData = [requestReply dataUsingEncoding:NSUTF8StringEncoding];
            //NSError *error = nil;
            NSDictionary *responseObj = [NSJSONSerialization
                                         JSONObjectWithData:jsonData
                                         options:0
                                         error:&error];
            
            if(! error){
                //Get rid of the loading icon
                
            } else {
                NSLog(@"Error in parsing JSON");
            }*/
            
            //This stops the loop
            self->hold = 1;
            
            
            
            
        }] resume];
        
        
    }else{
        [_warningView setHidden:false];
        hold = 1;
        
    }
    
}

//When the warning message ok button was pressed
- (IBAction)warningMessageOKButtonPressed:(id)sender {
    
    [_warningView setHidden:true];
    
}


//Text editing functions


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [UIView animateWithDuration:0.25 animations:^{
        //CGRect frame = textField.frame;
        //frame.origin.y -= 100;
        //textField.frame = frame;
        [self.view setFrame:CGRectMake(0,-110,320,460)];
    }];
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    
    
    
    [self.view endEditing:YES];
    return YES;
}




-(BOOL)textFieldShouldReturn:(UITextField*) textField
{
    NSLog(@"TestTest");
    [_titleTextField resignFirstResponder];
    [_moneyTextField resignFirstResponder];
    [_descriptionTextView resignFirstResponder];
    [UIView animateWithDuration:0.25 animations:^{
        //CGRect frame = textField.frame;
        //frame.origin.y += 100;
        //textField.frame = frame;
        CGSize s = self.view.frame.size;
        [self.view setFrame:CGRectMake(0,0,s.width,s.height)];
        
    }];
    
    
    
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_titleTextField resignFirstResponder];
    [_moneyTextField resignFirstResponder];
    [_descriptionTextView resignFirstResponder];
    [UIView animateWithDuration:0.25 animations:^{
        //CGRect frame = textField.frame;
        //frame.origin.y += 100;
        //textField.frame = frame;
        CGSize s = self.view.frame.size;
        [self.view setFrame:CGRectMake(0,0,s.width,s.height)];
        
    }];
    
}




@end
