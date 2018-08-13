//
//  PortfolioViewController.m
//  Dreamer
//
//  Created by Eric Rhodes on 8/7/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "PortfolioViewController.h"
#import "ContributorsTableViewCell.h"

@interface PortfolioViewController ()

@end

@implementation PortfolioViewController
{
    
    NSArray *data1;
    NSArray *data2;
    NSArray *data3;

    NSString* tab;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //This is default
    tab = @"1";
    
    data1 = [NSArray arrayWithObjects:@"test1",@"test1", nil];
    data2 = [NSArray arrayWithObjects:@"test2",@"test2", nil];
    data3 = [NSArray arrayWithObjects:@"test3",@"test3", nil];



    [_contributorsTableView setHidden:false];
    [_investersTableView setHidden:true];
    [_influencersTableView setHidden:true];
    
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
    
    //Changes the array based on the tab selected
    if([tab isEqualToString:@"1"]){
        return [data1 count];
        
    }else if([tab isEqualToString:@"2"]){
        return [data2 count];

    }else if([tab isEqualToString:@"3"]){
        return [data3 count];
    }
    return 0;
}



//NOW JUST NEED TO CHANGE HERE SO THAT IT TAKES A DIFFERENT CELL
//Adds the cell based on the data
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"ContributorsTableViewCell";
    
    ContributorsTableViewCell *cell = (ContributorsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ContributorsTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    
    //Changes the array based on the tab selected
    if([tab isEqualToString:@"1"]){
        cell.testLable.text = [data1 objectAtIndex:indexPath.row];
        
    }else if([tab isEqualToString:@"2"]){
        cell.testLable.text = [data2 objectAtIndex:indexPath.row];
        
    }else if([tab isEqualToString:@"3"]){
        cell.testLable.text = [data3 objectAtIndex:indexPath.row];
        
    }
    
    
    //cell.testlable.text = @"Test";
    //cell.weight.text = [weightData objectAtIndex:indexPath.row];
    
    /*
    cell.title.text = [titleData objectAtIndex:indexPath.row];
    cell.name.text = [nameData objectAtIndex:indexPath.row];
    cell.descrip.text = [descripData objectAtIndex:indexPath.row];
    cell.percentage.text = [percentData objectAtIndex:indexPath.row];
    cell.number.text = [numberData objectAtIndex:indexPath.row];
    */
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 135;
    // This is just Programatic method you can also do that by xib !
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


















//---THESE ARE TO MANAGE THE TABLES

//Shows the contributors data
- (IBAction)contributorsButtonPressed:(id)sender {
    
    tab = @"1";
    [_contributorsTableView setHidden:false];
    [_investersTableView setHidden:true];
    [_influencersTableView setHidden:true];
    
    [_contributorsTableView reloadData];
    [_investersTableView reloadData];
    [_influencersTableView reloadData];
}

//Shows the investers data
- (IBAction)investersButtonPressed:(id)sender {
    
    tab = @"2";
    [_contributorsTableView setHidden:true];
    [_investersTableView setHidden:false];
    [_influencersTableView setHidden:true];
    
    [_contributorsTableView reloadData];
    [_investersTableView reloadData];
    [_influencersTableView reloadData];

}

//Shows the influencers data
- (IBAction)influencersButtonPressed:(id)sender {
    
    tab = @"3";
    [_contributorsTableView setHidden:true];
    [_investersTableView setHidden:true];
    [_influencersTableView setHidden:false];
    
    [_contributorsTableView reloadData];
    [_investersTableView reloadData];
    [_influencersTableView reloadData];
    
}



- (IBAction)profileButtonPressed:(id)sender {
    
    [self.view setHidden:true];
}


@end
