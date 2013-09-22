//
//  ViewController.m
//  ReadingRates
//
//  Created by Nicholas Schneider on 6/29/13.
//  Copyright (c) 2013 Nicholas Schneider. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *backgroundTap = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self
                                             action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:backgroundTap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Calculator
- (IBAction)calculateButtonPressed:(id)sender {
    [self calculateWordsPerMinute];
    [self dismissKeyboard];
}

- (IBAction)wordsPerLineInfoButtonPressed:(id)sender {
    [self wordsPerLineInfoShowAlert];
}

- (IBAction)linesReadInfoButtonPressed:(id)sender {
    [self linesReadInfoShowAlert];
}

- (IBAction)timeInMinutesInfoButtonPressed:(id)sender {
    [self timeInMinutesInfoShowAlert];
}



- (void) calculateWordsPerMinute {
    float wordsPerLine = [self.wordsPerLineTextField.text floatValue];
    float linesRead = [self.linesReadTextField.text floatValue];
    float timeInMinutes = [self.timeInMinutesTextField.text floatValue];
    
    float wordsPerMinute = wordsPerLine * linesRead / timeInMinutes ;
    
    if (timeInMinutes) {
        self.wordsPerMinuteLabel.text = [NSString stringWithFormat:@"%.0f", wordsPerMinute];
    } else {
        self.wordsPerMinuteLabel.text = [NSString stringWithFormat:@"Words Per Minute"];
    }
}




// Keyboard Dismissal
- (void) dismissKeyboard {
    [self.view endEditing:YES];
}





// Info Button Alerts
- (void) wordsPerLineInfoShowAlert {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Words Per Line (WPL)"
                                                    message:@"To calculate WPL, count all words on 3 lines and divide by the number of lines. So if you count 45 words over 3 lines, your WPL will be 15."
                                                   delegate:self
                                          cancelButtonTitle:@"Okay"
                                          otherButtonTitles:@"Lines Read",@"Time In Minutes", nil];
    
    [alert show];
    
}


- (void) linesReadInfoShowAlert {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Lines Read"
                                                    message:@"Enter the number of lines read here. Remember to not count partial lines that consist of only a few words."
                                                   delegate:self
                                          cancelButtonTitle:@"Okay"
                                          otherButtonTitles: nil];
    
    [alert addButtonWithTitle:@"Words Per Line"];
    [alert addButtonWithTitle:@"Time In Minutes"];
    
    [alert show];
}


- (void) timeInMinutesInfoShowAlert {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time in Minutes"
                                                    message:@"Enter the number of minutes you spent reading here. It is acceptable to use decimals or round."
                                                   delegate:self
                                          cancelButtonTitle:@"Okay"
                                          otherButtonTitles: nil];
    
    [alert addButtonWithTitle:@"Words Per Line"];
    [alert addButtonWithTitle:@"Lines Read"];
    
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Words Per Line"]) {
        [self wordsPerLineInfoShowAlert];
    } else if ([title isEqualToString:@"Lines Read"]) {
        [self linesReadInfoShowAlert];
    } else if ( [title isEqualToString:@"Time In Minutes"]){
        [self timeInMinutesInfoShowAlert];
    }
}


// Stopwatch

- (NSTimer *)createTimer {
    return [NSTimer scheduledTimerWithTimeInterval:1.0
                                            target:self
                                          selector:@selector(timerTicked:)
                                          userInfo:nil
                                           repeats:YES];
}

- (void)timerTicked:(NSTimer *)timer {
    
    int timeInSeconds = [[NSDate date] timeIntervalSince1970] - _startTimeSince1970InSeconds + _stopwatchStartTime;
    _currentTimeInSeconds = timeInSeconds;
    
    self.stopwatchTimeLabel.text = [self formattedTime:_currentTimeInSeconds];
    
}

- (NSString *)formattedTime:(int)totalSeconds
{
    
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;

    NSString *formattedString = @"";
    
    if (hours < 1) {
         formattedString = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    } else {
         formattedString = [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
    }
    
    return formattedString;
}



- (IBAction)startButtonPressed:(id)sender {
    
    if (!_currentTimeInSeconds) {
        _currentTimeInSeconds = 0;
        _stopwatchStartTime = 0;
    }
    
    if (!_myTimer) {
        _myTimer = [self createTimer];
        _startTimeSince1970InSeconds = [[NSDate date] timeIntervalSince1970];
    }
    
}

- (IBAction)stopButtonPressed:(id)sender {
    
    [_myTimer invalidate];
    
    _stopwatchStartTime = _currentTimeInSeconds;
    
    [self updateTimeInMinutesTextFieldWithCurrentTime];
    
}

- (IBAction)resetButtonPressed:(id)sender {
    
    if (_myTimer) {
        [_myTimer invalidate];
        _myTimer = [self createTimer];
        _startTimeSince1970InSeconds = [[NSDate date] timeIntervalSince1970];
    }
    
    _currentTimeInSeconds = 0;
    _stopwatchStartTime = 0;
    
    self.stopwatchTimeLabel.text = [self formattedTime:_currentTimeInSeconds];
    
    
}


- (void)updateTimeInMinutesTextFieldWithCurrentTime {
    
    float currentTime = _currentTimeInSeconds / 60.0 ;
    
    self.timeInMinutesTextField.text = [NSString stringWithFormat:@"%.2f", currentTime];
    
}


@end
