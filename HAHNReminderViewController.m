//
//  HAHNReminderViewController.m
//  HypnoNerd
//
//  Created by Andrew Hahn on 3/18/15.
//  Copyright (c) 2015 Andrew Hahn. All rights reserved.
//

#import "HAHNReminderViewController.h"

@interface HAHNReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation HAHNReminderViewController

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
}

@end
