//
//  HAHNHypnosisViewController.m
//  HypnoNerd
//
//  Created by Andrew Hahn on 2/25/15.
//  Copyright (c) 2015 Andrew Hahn. All rights reserved.
//

#import "HAHNHypnosisViewController.h"
#import "HAHNHypnosisView.h"

@implementation HAHNHypnosisViewController

- (void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    HAHNHypnosisView *backgroundView = [[HAHNHypnosisView alloc] initWithFrame:frame];
    
    /* Add a UITextField to view */
    CGRect textFieldRect = CGRectMake(40, 85, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    // Setting the border sytle on the text field will allow us to see it more easily
    textField.borderStyle = UITextBorderStyleRoundedRect;
    // Give the text field some placeholder text and modify the keyboard's return type
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    
    [backgroundView addSubview:textField];
    
    // Set it as *the* view of this view controller
    self.view = backgroundView;
}


// Override UIViewController's designated initializer, initWithNibName:bundle:
// to get and set a tab bar item for HAHNHypnosisViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
        // Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *image = [UIImage imageNamed: @"Hypno.png"];
        
        // Put that image on the tab bar item
        self.tabBarItem.image = image;
    }
    
    return self;
}

// Override the viewDidLoad method to see view is only loaded when user taps the tab (lazy loading)
- (void)viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"HAHNHypnosisViewController loaded its view.");
    
    /* Silver Challenge - Controller Logic
       Add a UISegmentedControl for red, green, blue.
       circleColor changes correspondingly when user tabs each segment. */
    
    // Create an array to store the values for each segment
    NSArray *arrayForSegmentedControl = [[NSArray alloc] initWithObjects:@"Red", @"Green", @"Blue", nil];
    // Initialize the segment using the array
    UISegmentedControl *segmentedControl  = [[UISegmentedControl alloc] initWithItems:arrayForSegmentedControl];
    // Assign it a location on the screen & size the control
    segmentedControl.frame = CGRectMake(35, 50, 250, 25);
    
    // Point it towards a method that is called when the user interacts with it
    [segmentedControl addTarget:self.view
                         action:@selector(selectCircleColor:)
               forControlEvents:UIControlEventValueChanged];
    // Add as a subview
    [self.view addSubview:segmentedControl];
}


@end
