//
//  ViewController.h
//  ReadingRates
//
//  Created by Nicholas Schneider on 6/29/13.
//  Copyright (c) 2013 Nicholas Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// Calculator Components
@property (weak, nonatomic) IBOutlet UITextField *wordsPerLineTextField;
@property (weak, nonatomic) IBOutlet UITextField *linesReadTextField;
@property (weak, nonatomic) IBOutlet UITextField *timeInMinutesTextField;

@property (weak, nonatomic) IBOutlet UILabel *wordsPerMinuteLabel;

- (IBAction)calculateButtonPressed:(id)sender;

- (IBAction)wordsPerLineInfoButtonPressed:(id)sender;
- (IBAction)linesReadInfoButtonPressed:(id)sender;
- (IBAction)timeInMinutesInfoButtonPressed:(id)sender;


// Stopwatch Components
- (IBAction)startButtonPressed:(id)sender;
- (IBAction)stopButtonPressed:(id)sender;
- (IBAction)resetButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *stopwatchTimeLabel;

@property (weak, nonatomic) NSTimer *myTimer;
@property int currentTimeInSeconds;


@end
