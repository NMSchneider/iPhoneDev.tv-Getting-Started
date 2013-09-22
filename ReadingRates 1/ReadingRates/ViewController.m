//
//  ViewController.m
//  ReadingRates
//
//  Created by Nicholas Schneider on 6/29/13.
//  Copyright (c) 2013 Nicholas Schneider. All rights reserved.
//

#import "ViewController.h"

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

- (IBAction)calculateButtonPressed:(id)sender {
    [self calculateWordsPerMinute];
    [self dismissKeyboard];
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


- (void) dismissKeyboard {
    [self.view endEditing:YES];
}

@end
