//
//  ProfileTableViewCell.m
//  Dreamer
//
//  Created by Eric Rhodes on 7/24/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "ProfileTableViewCell.h"
#import "ProfileViewController.h"

@implementation ProfileTableViewCell
{
    int hold;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //
    hold = 0;
}

- (IBAction)heartButtonPressed:(id)sender {
    
    NSInteger index = self.tag;
    NSLog(@"This is a test: %li",(long)index);
    [(ProfileViewController*)self.inputViewController setSelectedIndex];
    NSString* recieverID = [(ProfileViewController*)self.inputViewController getUserID:(int)index];
    
    NSLog(@"RecienveID: %@", recieverID);
    
    
    //Get user ID
    /*NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString* userID = [prefs stringForKey:@"userID"];
    */
    
    
    
    //Now send request
    
    
    
    
    
}

-(void)addContributer
{
    //Send the request to the server
    
}











- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
