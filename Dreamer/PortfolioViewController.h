//
//  PortfolioViewController.h
//  Dreamer
//
//  Created by Eric Rhodes on 8/7/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PortfolioViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UIButton *profileButton;


@property (weak, nonatomic) IBOutlet UITableView *contributorsTableView;

@property (weak, nonatomic) IBOutlet UITableView *investersTableView;

@property (weak, nonatomic) IBOutlet UITableView *influencersTableView;



@end
