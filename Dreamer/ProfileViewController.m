//
//  ProfileViewController.m
//  Dreamer
//
//  Created by Eric Rhodes on 7/24/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileTableViewCell.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
{
    NSMutableArray *data;
    
    //Values that hold general User data
    NSString *userID;
    NSString *handle;
    NSString *address;
    NSString *percent;
    NSString *number_believer;
    NSString *number_investers;
    
    //Componenets of the tableView Cell
    NSMutableArray *idData;
    NSMutableArray *nameData;
    NSMutableArray *titleData;
    NSMutableArray *descripData;
    NSMutableArray *percentData;
    NSMutableArray *numberData;
    
    
    //Array to hold the different campaigns of the user
    //NOTE: This array comes in same way as others above
    //      It will require a new request to be made.
    NSArray *campaigns;

    //For general information loading
    int feedLoaded;
    
    //This is for the different values of feeds that are loaded
    //  Same function as the feedLoaded variable
    int hold;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //The initialization of the data array
    data = [NSMutableArray arrayWithObjects:nil];
    
    //General information hold
    feedLoaded = 0;
    
    //Initialize user general data
    userID = @"";
    
    
    //Initialize arrays for table view
    idData = [NSMutableArray arrayWithObjects:nil];
    nameData = [NSMutableArray arrayWithObjects:nil];
    titleData = [NSMutableArray arrayWithObjects:nil];
    descripData = [NSMutableArray arrayWithObjects: nil];
    percentData = [NSMutableArray arrayWithObjects:nil];
    numberData = [NSMutableArray arrayWithObjects:nil];


    
    //TODO:
    //Use same method for adding data to the table as the other view controller
    
    //LoadUser Information
    
    //This is test information
    //Make sure to change
    
    //THIS IS WHERE WE STOPPED BECAUSE OF INTERNET ISSUE
    /*[self loadUserData:@"eric2"];
    
    //It will change to 1 if the information is returned
    while(feedLoaded == 0);
    
    //Add the values to the view
    _percentLabel.text = self->percent;
    _userNameLabel.text = self->userID;//I guess this is going to be the name
    _handleLabel.text = self->handle;
    _addressLabel.text = self->address;
    _numberOfBelieversLabel.text = self->number_believer;
    _numberOfInvestersLabel.text = self->number_investers;
    
    //Now load the feed/campaign data
    //This will call each method
    for(NSString *s in campaigns)
    {
        NSLog(@"%@", s);
        //Now make a call to the server to get the appropriate feedid
        [self loadSpecificFeedData:s];
        while(hold == 0);
        
        //Back to hold
        hold = 0;
        
    }

    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

//This takes the the campaigns array and generates the tabels view cells to accompany it.
-(void)loadSpecificFeedData: (NSString*) feedID
{
    //This is the origional
    NSString* url = [NSString stringWithFormat:@"http://erhodes.oucreate.com/Dreamer/getSingleFeed.php?feedid=%@",feedID];
    
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
        
        //Convert the data to a managable format
        NSData* jsonData = [requestReply dataUsingEncoding:NSUTF8StringEncoding];
        //NSError *error = nil;
        NSDictionary *responseObj = [NSJSONSerialization
                                     JSONObjectWithData:jsonData
                                     options:0
                                     error:&error];
        
        if(! error) {
            
            //Ex: This will print the id of the user
            //NSArray *responseArray = [responseObj objectForKey:@"id"];
            //NSLog(@"%@",responseArray);
            
            //Ex: also can change as a string and will work the same way
            //NSString *username = [responseObj objectForKey:@"id"];
            //NSLog(@"%@", username);
            
            //Ex: This is a searching example through the file
            /*for (NSDictionary *alternative in responseArray) {
             NSArray *altArray = [alternative objectForKey:@"alternative"];
             for (NSDictionary *transcript in altArray) {
             NSLog(@"transcript : %@",[transcript objectForKey:@"transcript"]);
             }
             }*/
            
            //These are values that are associated with the account
            NSString *userID = [responseObj objectForKey:@"id"];
            NSString *fullName = [responseObj objectForKey:@"name"];
            NSString *title = [responseObj objectForKey:@"title"];
            NSString *description = [responseObj objectForKey:@"description"];
            NSString *percentage = [NSString stringWithFormat:@"%@ %%",[responseObj objectForKey:@"percentage"]];
            
            NSString *number = [responseObj objectForKey:@"number"];
            NSString *type = [responseObj objectForKey:@"type"];
            
            [self->idData addObject:userID];
            [self->nameData addObject:fullName];
            [self->titleData addObject:title];
            [self->descripData addObject:description];
            [self->percentData addObject:percentage];
            [self->numberData addObject:number];
            //Type data we'll just leave alone for the moment
            
            [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
            
            
            
            //NSLog(@"%@", username);
            
        } else {
            NSLog(@"Error in parsing JSON");
        }
        //NSLog(@"%@", jsonData);
        
        //This stops the loop
        self->hold = 1;
        
        //This splits the string into an array seperated by ","
        //self->feedsArray = [requestReply componentsSeparatedByString:@","];
        //self->feedLoaded = 1;
        
        
        
        
        
    }] resume];
}

//This loads user data into the app based off of the id of the user
-(void)loadUserData: (NSString*) userID
{
    NSString* url = [NSString stringWithFormat:@"http://erhodes.oucreate.com/Dreamer/getUserHomeData.php?userid=%@",userID];
    
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        NSLog(@"requestReply: %@", requestReply);//This works well in getting the data
        
        //Allows count function to change to the amount of things in the lists
        
        //This set the list of campaigns the user has
        //self->feedsArray = [requestReply componentsSeparatedByString:@","];
        
        
        //This is data from the json
        //Convert the data to a managable format
        NSData* jsonData = [requestReply dataUsingEncoding:NSUTF8StringEncoding];
        //NSError *error = nil;
        NSDictionary *responseObj = [NSJSONSerialization
                                     JSONObjectWithData:jsonData
                                     options:0
                                     error:&error];
        
        if(! error) {
            
            //Ex: This will print the id of the user
            //NSArray *responseArray = [responseObj objectForKey:@"id"];
            //NSLog(@"%@",responseArray);
            
            //Ex: also can change as a string and will work the same way
            //NSString *username = [responseObj objectForKey:@"id"];
            //NSLog(@"%@", username);
            
            //Ex: This is a searching example through the file
            /*for (NSDictionary *alternative in responseArray) {
             NSArray *altArray = [alternative objectForKey:@"alternative"];
             for (NSDictionary *transcript in altArray) {
             NSLog(@"transcript : %@",[transcript objectForKey:@"transcript"]);
             }
             }*/
            
            //These are values that are associated with the account
            self->userID = [responseObj objectForKey:@"userID"];
            self->handle = [responseObj objectForKey:@"handle"];
            self->address = [responseObj objectForKey:@"address"];
            self->number_believer = [responseObj objectForKey:@"number_believers"];
            self->number_investers = [responseObj objectForKey:@"number_investers"];
            self->percent = [NSString stringWithFormat:@"%@ %%",[responseObj objectForKey:@"percent"]];
            
            //Also from request
            NSString *campaig_combined = [responseObj objectForKey:@"campaigns"];
            self->campaigns = [campaig_combined componentsSeparatedByString:@","];

            
            self->feedLoaded = 1;
            
            
            
            
            //NSLog(@"%@", username);
            
        } else {
            NSLog(@"Error in parsing JSON");
        }
        
        
        
    }] resume];
}

//Gets the number of rows in the section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [titleData count];
}




//Adds the cell based on the data
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"ProfileTableViewCell";
    
    ProfileTableViewCell *cell = (ProfileTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProfileTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    
    //This is a test and you should replace with appropriate things
    cell.title.text = [titleData objectAtIndex:indexPath.row];
    cell.name.text = [nameData objectAtIndex:indexPath.row];
    cell.descrip.text = [descripData objectAtIndex:indexPath.row];
    cell.percentage.text = [percentData objectAtIndex:indexPath.row];
    cell.number.text = [numberData objectAtIndex:indexPath.row];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 135;//Might have to change the size
    // This is just Programatic method you can also do that by xib !
}

@end
