//
//  mainViewController.m
//  Dreamer
//
//  Created by Eric Rhodes on 7/22/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "mainViewController.h"
#import "mainFeedTableViewCell.h"

@interface mainViewController ()

@end

@implementation mainViewController
{
    //bool front;
    //UIView *mainFeed;
    //UIView *profileView;
    
    UIViewController* createNewCampaignViewController;
    
    
    //Componenets of the tableView Cell
    NSMutableArray *idData;
    NSMutableArray *nameData;
    NSMutableArray *titleData;
    NSMutableArray *descripData;
    NSMutableArray *percentData;
    NSMutableArray *numberData;
    
    int currentIndex;
    
    NSArray *feedsArray;
    
    bool start;
    
    int feedLoaded;
    int hold;
}

/*-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"Test 1.");
    start = true;

}*/


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Disables the user interagction until the users is logged in.
    //Add this here
    
    //This is to use before loading data
    //So it doesn't load any blanks
    //start = true;
    
    NSLog(@"This is another test.");
    
    idData = [NSMutableArray arrayWithObjects:nil];
    nameData = [NSMutableArray arrayWithObjects:nil];
    titleData = [NSMutableArray arrayWithObjects:nil];
    descripData = [NSMutableArray arrayWithObjects: nil];
    percentData = [NSMutableArray arrayWithObjects:nil];
    numberData = [NSMutableArray arrayWithObjects:nil];

    
    //These are markers so that it can continue after call.
    feedLoaded = 0;
    hold = 0;//This is for multiple loads.
    
    //[self.view setUserInteractionEnabled:true];
    
    //Front true = mainFeed , false = profile
    //front = false;
    
    //Test that the view can change...
    
    //_mainButton.layer.zPosition = 3;
    
    //mainFeed = [[[NSBundle mainBundle] loadNibNamed:@"MainFeedView" owner:self options:nil] objectAtIndex:0];
    
    //UIView *profileView = [[[NSBundle mainBundle] loadNibNamed:@"ProfileView" owner:self options:nil] objectAtIndex:0];
    //UIView *containerView = [[[NSBundle mainBundle] loadNibNamed:@"MyContainerView" owner:self options:nil] lastObject];
    //[rootView addSubview:containerView];
    
    //[self.view addSubview:mainFeed];
    //[self.view addSubview:profileView];
    
    //Will use setHidden to manage the two
    //[profileView setHidden:true];
    
    
    //----------------------------------------
    //Load the data
    
    //start = false;
    
    //THIS IS WHERE WE STOPPED BECAUSE OF INTERNET ISSUE
    /*[self loadFeedData];
    while(feedLoaded == 0); //This is so that it waits until its done loading
    
    //This will call each method
    for(NSString *s in feedsArray)
    {
        NSLog(@"%@", s);
        //Now make a call to the server to get the appropriate feedid
        [self loadSpecificFeedData:s];
        while(hold == 0);
        
        //Back to hold
        hold = 0;
        
    }*/
    
    //[self checkIfLoggedIn];

    
}

-(void)checkIfLoggedIn
{
    //This loads the users data
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString* userName = [prefs stringForKey:@"userID"];
    
    
    NSString* accessToken = [prefs stringForKey:@"accessToken"];
    
    NSLog(@"%@", userName);
    
    if(userName == NULL)
    {
        //Send to the log in page
        [self performSegueWithIdentifier:@"Login" sender:self];
        NSLog(@"Test");

        
    }
    
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Login"]) {
        
        // Get destination view
        //LoginViewController *vc = [segue destinationViewController];
        
        //vc.cowName = [nameData objectAtIndex:currentIndex];
        //NSLog(@"Cow Name: %@", [nameData objectAtIndex:currentIndex]);
        
        // Pass the information to your destination view
        //[vc setSelectedButton:tagIndex];
    }
}




-(void) loadSpecificFeedData: (NSString*) feedID
{
    //Make a request to load the series of ids of different feeds
    //Then for each feed, pull the data from it and then create a new tableView cell with that data
    //After each one please update the table view
    
    //NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    //NSString* userName = [prefs stringForKey:@"userID"];
    
    //NSArray* array = NULL;
    
    //NSString* accessToken = [prefs stringForKey:@"accessToken"];
    
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

-(void) loadFeedData
{
    //Make a request to load the series of ids of different feeds
    //Then for each feed, pull the data from it and then create a new tableView cell with that data
    //After each one please update the table view
    
    //NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    //NSString* userName = [prefs stringForKey:@"userID"];
    
    //NSArray* array = NULL;
    
    //NSString* accessToken = [prefs stringForKey:@"accessToken"];
    
    //This is the origional
    //NSString* url = [NSString stringWithFormat:@"http://erhodes.oucreate.com/Cows/getListOfCows.php?userID=%@&token=%@&q=%@",userName,accessToken,@"QueryByName"];
    
    //This is what we want to call
    //erhodes.oucreate.com/Dreamer/loadFeed.php
    NSString* url = [NSString stringWithFormat:@"http://erhodes.oucreate.com/Dreamer/loadFeed.php"];
    
   
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        NSLog(@"requestReply: %@", requestReply);//This works well in getting the data
        
        //Allows count function to change to the amount of things in the lists
        self->start = false;
        
        //This splits the string into an array seperated by ","
        self->feedsArray = [requestReply componentsSeparatedByString:@","];
        self->feedLoaded = 1;
        
        
        
    }] resume];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Gets the number of rows in the section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /*NSUInteger check;
    //Note:
    //  Make sure to have a check here or else it will just populate it with an empty field
    if(start){
        check = 0;
    }
    else{
        check = [titleData count];
    }*/
    return [titleData count];
}




//Adds the cell based on the data
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"mainFeedTableViewCell";
    
    mainFeedTableViewCell *cell = (mainFeedTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"mainFeedTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    
    //cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    //cell.testlable.text = @"Test";
    //cell.weight.text = [weightData objectAtIndex:indexPath.row];
    
    cell.title.text = [titleData objectAtIndex:indexPath.row];
    cell.name.text = [nameData objectAtIndex:indexPath.row];
    cell.descrip.text = [descripData objectAtIndex:indexPath.row];
    cell.percentage.text = [percentData objectAtIndex:indexPath.row];
    cell.number.text = [numberData objectAtIndex:indexPath.row];

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 135;
    // This is just Programatic method you can also do that by xib !
}

- (IBAction)createNewCampaignButtonPressed:(id)sender {
    
    //This will grab a viewController
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ExternalContent_Location_1" bundle:nil];
    
    createNewCampaignViewController = [storyboard instantiateViewControllerWithIdentifier:@"CreateCampaignViewController"];
    [self addChildViewController:createNewCampaignViewController];
    [self.view addSubview:createNewCampaignViewController.view];
    
    /*createNewCampaignViewController = [[[NSBundle mainBundle] loadNibNamed:@"CreateCampaignViewController" owner:self options:nil] objectAtIndex:0];
    //[self addChildViewController:createNewCampaignViewController];
    [self.view addSubview:createNewCampaignViewController];*/
}













@end
