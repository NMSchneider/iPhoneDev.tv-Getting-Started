//
//  ViewController.h
//  ReadingRates
//
//  Created by Nicholas Schneider on 11/11/13.
//  Copyright (c) 2013 Nicholas Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *wordsPerLineTextField;
@property (weak, nonatomic) IBOutlet UITextField *linesReadTextField;
@property (weak, nonatomic) IBOutlet UITextField *timeInMinutesTextField;

@property (weak, nonatomic) IBOutlet UILabel *wordsPerMinuteLabel;

- (IBAction)calculateButtonPressed:(id)sender;

@end
