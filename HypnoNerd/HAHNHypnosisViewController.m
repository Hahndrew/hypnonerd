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

@end
