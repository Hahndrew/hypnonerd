//
//  HAHNHypnosisView.m
//  Hypnosister2
//
//  Created by Andrew Hahn on 2/3/15.
//  Copyright (c) 2015 Andrew Hahn. All rights reserved.
//

#import "HAHNHypnosisView.h"

@interface HAHNHypnosisView ()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation HAHNHypnosisView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect bounds = self.bounds;
    
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.x + bounds.size.height / 2.0;
    
    // The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius // Note this is currentRadius!
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    // Configure line width to 10 points
    path.lineWidth = 10;
    
    // Configure the drawing color to circleColor
    [self.circleColor setStroke];
    
    // Draw the path
    [path stroke];
    
    // make CGRect to define image size
    CGRect myImageSize = CGRectMake(center.x - 50, center.y - 50, 100, 100);
    
    // make UIImage to load up to view
    UIImage *myImage = [UIImage imageNamed:@"pandora_box.png"];
    
    // Get the current graphics context
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    // Save the graphics state before setting the shadow
    CGContextSaveGState(currentContext);
    
    // Set the shadow
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 2);
    
    // Draw image
    [myImage drawInRect:myImageSize
              blendMode:kCGBlendModeNormal
                  alpha:0.7];
    
    // Restore a previously saved graphics state
    CGContextRestoreGState(currentContext);
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All HAHNHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
        
        // Create a default circleColor for instances of HAHNHyponosisView
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

// Override touchesBegan:withEvent: to generate a log message,
// create a random-colored UIColor, and set circleColor to this color
// When a finger touches the screen
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    
    // Get 3 random numbers between 0 and 1
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    
    self.circleColor = randomColor;
}

// implement a custom accessor for the circleColor property
// to send setNeedsDisplay to the view whenever this property is changed.
- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}




@end
