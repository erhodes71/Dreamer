//
//  ProfileViewController.m
//  Dreamer
//
//  Created by Eric Rhodes on 7/24/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileTableViewCell.h"
#import "RootViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
{
    //The current index
    int currentIndex;
    
    //The campaign that is selected
    UIViewController* campaignInfoViewController;
    
    //Sign-In View Controller
    UIViewController* signInViewController;
    
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
    
    
    int indexCounter;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    indexCounter = 0;
    
    
    //The initialization of the data array
    data = [NSMutableArray arrayWithObjects:nil];
    
    //General information hold
    feedLoaded = 0;
    
    
    
    
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
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString* user_ID = [prefs stringForKey:@"userID"];
    
    
    //Initialize user general data
    userID = user_ID;
    
    //THIS IS WHERE WE STOPPED BECAUSE OF INTERNET ISSUE
    [self loadUserData:userID];
    
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

    
}

//This is used to call the parent to bring back the buttons
-(void)showRootViewButtons
{
    [(RootViewController*)self.parentViewController bringBackButtons_side2];
    
}

-(void)setSelectedIndex
{
    
}


//--- To get current index items ---

//Gets the username
-(NSString*)getCurrentIndexID
{
    return idData[self->currentIndex];
}

//Gets the name
-(NSString*)getCurrentIndexName
{
    return nameData[self->currentIndex];
}

//Gets the Title
-(NSString*)getCurrentIndexTitle
{
    return titleData[self->currentIndex];
}

//Gets the description
-(NSString*)getCurrentIndexDescription
{
    return descripData[self->currentIndex];
}

//Gets the percent
-(NSString*)getCurrentIndexPercent
{
    return percentData[self->currentIndex];
}

//Gets the Number
-(NSString*)getCurrentIndexNumber
{
    return numberData[self->currentIndex];
}

// --- ---






//If reload button is pressed
- (IBAction)reloadButtonPressed:(id)sender {
    
    [self initializeViewController];
}

-(void)initializeViewController
{
    //Sets back to 0
    indexCounter = 0;
    
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
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString* user_ID = [prefs stringForKey:@"userID"];
    
    
    //Initialize user general data
    userID = user_ID;
    
    //THIS IS WHERE WE STOPPED BECAUSE OF INTERNET ISSUE
    [self loadUserData:userID];
    
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

            
            
            
            
            
            //NSLog(@"%@", username);
            
        } else {
            NSLog(@"Error in parsing JSON");
        }
        
        self->feedLoaded = 1;

        
        
        
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
    
    //NSLog(@"TEST %i",indexCounter);
    cell.tag = indexCounter;
    indexCounter++;
    
    return cell;
}


//If that cell is selected
//Needs to be able to take it to a window
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld", (long)indexPath.row);
    //NSLog(@"%@", currentIndex);
    
    currentIndex = (int)indexPath.row;
    
    
    [(RootViewController*)self.parentViewController hideButtons_side2];
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ExternalContent_Location_1" bundle:nil];
    
    campaignInfoViewController = [storyboard instantiateViewControllerWithIdentifier:@"CampaignPageViewController"];
    [self addChildViewController:campaignInfoViewController];
    [self.view addSubview:campaignInfoViewController.view];
    
    
    //
    /*RootViewController *v = (RootViewController*)self.view.superclass;
     [v sendToOtherViewController];*/
    
    //Hides the buttons
    [(RootViewController*)self.parentViewController hideButtons_side2];
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 135;//Might have to change the size
    // This is just Programatic method you can also do that by xib !
}

//Get the user ID of the user
-(NSString*) getUserID:(int)indexToUse
{
    return idData[indexToUse];
}


//This is currently being a sign-out feature
//      TODO: Please change before continue
//            Currently is going to clear the user data
- (IBAction)signInButtonPressed:(id)sender {
    
    //Adds singIn View Controller view to the profile view
    /*UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    signInViewController = [storyboard instantiateViewControllerWithIdentifier:@"SignInViewController"];
    [self addChildViewController:signInViewController];
    [self.view addSubview:signInViewController.view];
     */
    
    //Hides the buttons
    //[(RootViewController*)self.parentViewController hideButtons_side2];
    
    
    //-------- CLEAR DATA HERE --------
    //Save the data
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    //Save data
    [prefs setObject:@"" forKey:@"userID"];
    [prefs setObject:@"" forKey:@"password"];
    [prefs setObject:@"" forKey:@"token"];
    
    
    
}
















@end
