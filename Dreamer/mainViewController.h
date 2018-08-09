//
//  mainViewController.h
//  Dreamer
//
//  Created by Eric Rhodes on 7/22/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "ViewController.h"

@interface mainViewController : ViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *mainButton;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(NSString*)getCurrentIndexID;
-(NSString*)getCurrentIndexName;
-(NSString*)getCurrentIndexTitle;
-(NSString*)getCurrentIndexDescription;
-(NSString*)getCurrentIndexPercent;
-(NSString*)getCurrentIndexNumber;

-(void)showRootViewButtons;



@end
