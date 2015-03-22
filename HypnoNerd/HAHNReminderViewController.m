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
    
    // Adding a local notification
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    // register notification - required in iOS8
    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:1 << 2
                                                                                                             categories:nil]];
    
    // Schedule the local notification
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

// Override UIViewController's designated initializer, initWithNibName:bundle:
// to get and set a tab bar item for HAHNReminderViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
        // Set the tab bar item's title
        self.tabBarItem.title = @"Reminder";
        
        // Create a UIImage from a file
        // This will use Time@2x.png on retina display devices
        UIImage *image = [UIImage imageNamed: @"Time.png"];
        
        // Put that image on the tab bar item
        self.tabBarItem.image = image;
    }
    
    return self;
}

@end
