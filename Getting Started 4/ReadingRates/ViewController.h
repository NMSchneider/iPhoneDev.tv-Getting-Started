//
//  ViewController.h
//  ReadingRates
//
//  Created by Nicholas Schneider on 11/11/13.
//  Copyright (c) 2013 Nicholas Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

#pragma mark - Calculator
// Calculator Components
@property (weak, nonatomic) IBOutlet UITextField *wordsPerLineTextField;
@property (weak, nonatomic) IBOutlet UITextField *linesReadTextField;
@property (weak, nonatomic) IBOutlet UITextField *timeInMinutesTextField;

@property (weak, nonatomic) IBOutlet UILabel *wordsPerMinuteLabel;

- (IBAction)calculateButtonPressed:(id)sender;

- (IBAction)wordsPerLineInfoButtonPressed:(id)sender;
- (IBAction)linesReadInfoButtonPressed:(id)sender;
- (IBAction)timeInMinutesInfoButtonPressed:(id)sender;


#pragma mark - Stopwatch
// Stopwatch Components
- (IBAction)startButtonPressed:(id)sender;
- (IBAction)stopButtonPressed:(id)sender;
- (IBAction)resetButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *stopwatchTimeLabel;

@property (weak, nonatomic) NSTimer *myTimer;
@property int currentTimeInSeconds;

@property int startTimeSince1970InSeconds;
@property int stopwatchStartTime;


#pragma mark - Helper Functions
- (void)updateTimeInMinutesTextFieldWithCurrentTime;

@end
