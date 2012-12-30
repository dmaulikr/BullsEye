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
    int score;
    int round;
}
@synthesize slider;
@synthesize targetLabel;
@synthesize scoreLabel;
@synthesize roundLabel;

- (void)updateLabels;
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", round];
}

- (void)startNewRound
{
    targetValue = 1 + (arc4random() % 100);
    currentValue = self.slider.value;
    self.slider.value = currentValue;
    round += 1;
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
    int difference = abs(targetValue - currentValue);
    int points = 100 - difference;
    score += points;
    
    NSString *title;
    if (difference == 0) {
        title = @"Perfect!";
    } else if (difference < 5) {
        title = @"Almost had it!";
    } else if (difference < 10) {
        title = @"Pretty good";
    } else {
        title = @"Not even close";
    }
    
    NSString *message = [NSString stringWithFormat:
      @"The value of the slider is: %d\n The target value is: %d\n The difference is: %d\n You scored %d points\n Score: %d", currentValue, targetValue, difference, points, score];
    
    UIAlertView *alertView = [[UIAlertView alloc]
      initWithTitle:title
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
