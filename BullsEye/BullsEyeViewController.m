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
    int targetValue;
}
@synthesize slider;
@synthesize targetLabel;

- (void)updateLabels;
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", targetValue];
}

- (void)startNewRound
{
    targetValue = 1 + (arc4random() % 100);
    currentValue = self.slider.value;
    self.slider.value = currentValue;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewRound];
    [self updateLabels];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert
{
    int difference;
    if (targetValue > currentValue) {
        difference = targetValue - currentValue;
    }
    else if (currentValue > targetValue){
        difference = currentValue - targetValue;
    }
    else {
        difference = 0; 
    }
    NSString *message = [NSString stringWithFormat:
      @"The value of the slider is: %d\n The target value is: %d\n The difference is: %d", currentValue, targetValue, difference];
    
    UIAlertView *alertView = [[UIAlertView alloc]
      initWithTitle:@"Hello World!"
      message:message
      delegate:nil
      cancelButtonTitle:@"Awesome"
      otherButtonTitles:nil];
    
    [alertView show];
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)sliderMoved:(UISlider *)sender
{
    currentValue = lroundf(sender.value);
}

@end
