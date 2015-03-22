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
}

@end
