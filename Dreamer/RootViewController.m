//
//  RootViewController.m
//  Dreamer
//
//  Created by Eric Rhodes on 7/26/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import "RootViewController.h"
#import "mainViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //This is how you can manage multiple views on one view controller
    //  This is also how you get the view controller from the storyboard.
    UIViewController* svc = [self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewController"];
    [self addChildViewController:svc];
    [self.view addSubview:svc.view];
    
    //[self bringSubviewToFront:_testButton]

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
