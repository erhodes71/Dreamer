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
    
    NSArray *nameData;
    NSArray *weightData;
    int currentIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"This is another test.");
    
    nameData = [NSArray arrayWithObjects:@"test", nil];
    weightData = [NSArray arrayWithObjects:@"test", nil];
    
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
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Gets the number of rows in the section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [nameData count];
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
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 135;
    // This is just Programatic method you can also do that by xib !
}








@end
