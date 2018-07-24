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
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //The initialization of the data array
    data = [NSMutableArray arrayWithObjects:nil];
    
    //TODO:
    //Use same method for adding data to the table as the other view controller

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

//Gets the number of rows in the section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [data count];
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
    cell.test.text = [data objectAtIndex:indexPath.row];
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 135;//Might have to change the size
    // This is just Programatic method you can also do that by xib !
}

@end
