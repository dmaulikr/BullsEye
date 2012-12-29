//
//  BullsEyeViewController.m
//  BullsEye
//
//  Created by Scott Chiang on 12/28/12.
//  Copyright (c) 2012 Scott Chiang. All rights reserved.
//

#import "BullsEyeViewController.h"

@interface BullsEyeViewController ()

@end

@implementation BullsEyeViewController
{
    int currentValue;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert
{
    UIAlertView *alertView = [[UIAlertView alloc]
      initWithTitle:@"Hello World!"
      message:@"This is a BullsEye app"
      delegate:nil
      cancelButtonTitle:@"Awesome"
      otherButtonTitles:nil];
    
    [alertView show];
}

- (IBAction)sliderMoved:(UISlider *)slider
{
    currentValue = lroundf(slider.value);
}

@end
