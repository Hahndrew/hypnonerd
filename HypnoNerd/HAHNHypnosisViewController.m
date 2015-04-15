//
//  HAHNHypnosisViewController.m
//  HypnoNerd
//
//  Created by Andrew Hahn on 2/25/15.
//  Copyright (c) 2015 Andrew Hahn. All rights reserved.
//

#import "HAHNHypnosisViewController.h"
#import "HAHNHypnosisView.h"

// Declare that HAHNHypnosisViewController conforms to the UITextFieldDelegate protocol
@interface HAHNHypnosisViewController () <UITextFieldDelegate>
@end

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
    
    // set the delegate property of the UITextField to point at the HAHNHypnosisViewController
    textField.delegate = self;
    
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

// Implementing the method to be called when the user taps the Done button
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // Pass in the field's text
    [self drawHypnoticMessage:textField.text];
    
    // clear the text that the user typed
    textField.text = @"";
    
    // dismiss the keyboard
    [textField resignFirstResponder];
    
    return YES;
}

// Draw a given string on the screen twenty times at random positions
- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        // Configure the label's colors and text
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        // This method resizes the label, which will be relative
        // to the text that it is displaying
        [messageLabel sizeToFit];
        
        // Get a random x value that fits within the hypnosis view's width
        int width = self.view.bounds.size.width - messageLabel.bounds.size.width;
        int x = arc4random() % width;
        
        // Get a random y value that fits within the hypnosis view's height
        int height = self.view.bounds.size.width - messageLabel.bounds.size.height;
        int y = arc4random() % height;
        
        // Update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        // Add the label to the hierarchy
        [self.view addSubview:messageLabel];
        
        // add a vertical and horizontal motion effect to each label
        // that allows its center to sway 25 points in either direction
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @-25;
        motionEffect.maximumRelativeValue = @25;
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @-25;
        motionEffect.maximumRelativeValue = @25;
        [messageLabel addMotionEffect:motionEffect];
    }
}


@end
