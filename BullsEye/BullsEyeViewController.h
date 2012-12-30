//
//  BullsEyeViewController.h
//  BullsEye
//
//  Created by Scott Chiang on 12/28/12.
//  Copyright (c) 2012 Scott Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BullsEyeViewController : UIViewController <UIAlertViewDelegate>

- (IBAction)showAlert;
- (IBAction)sliderMoved:(UISlider *)sender;
@property(nonatomic, strong) IBOutlet UISlider *slider;
@property(nonatomic, strong) IBOutlet UILabel *targetLabel;
@property(nonatomic, strong) IBOutlet UILabel *scoreLabel;
@property(nonatomic, strong) IBOutlet UILabel *roundLabel;

@end
