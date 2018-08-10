//
//  RootViewController.h
//  Dreamer
//
//  Created by Eric Rhodes on 7/26/18.
//  Copyright © 2018 Eric Rhodes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *mainButton;

@property (weak, nonatomic) IBOutlet UIButton *globeButton;

@property (weak, nonatomic) IBOutlet UIButton *portfolioButton;



-(void)sendToOtherViewController;
-(void)hideButtons_side1;
-(void)bringBackButtons_side1;
-(void)bringBackButtons_side2;
-(void)hideButtons_side2;
-(void)finishInitialization;


@end
