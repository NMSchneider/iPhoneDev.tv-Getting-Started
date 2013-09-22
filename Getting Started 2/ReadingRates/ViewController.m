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

- (void) dismissKeyboard {
    [self.view endEditing:YES];
}

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



@end
