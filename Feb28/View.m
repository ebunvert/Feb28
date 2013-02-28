//
//  View.m
//  Feb28
//
//  Created by Eric Unvert on 2/28/13.
//  Copyright (c) 2013 Eric Unvert. All rights reserved.
//

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	// Drawing code
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGContextRef c = UIGraphicsGetCurrentContext();
    
 
    //red bar on a field of white (191,10,48)
	CGContextBeginPath(c);
	CGContextAddRect(c, CGRectMake(w / 2, 0, w / 2, h));
	CGContextSetRGBFillColor(c, 0.74901, 0.03921, 0.188235, 1);
	CGContextFillPath(c);
    
	//blue region of TX flag - top 1/3
    // described as navy blue - (0,40,104)
	CGContextBeginPath(c);
	CGContextAddRect(c, CGRectMake(0, 0, w, h * 1 / 3));
	CGContextSetRGBFillColor(c, 0.0, 0.156862, 0.407843, 1.0);
	CGContextFillPath(c);

    //White star middle of blue field: .3/4 of the height of the blue field
    //in the center (H) of the blue field.
	
    CGPoint center = CGPointMake(w / 2, h / 6);
    CGFloat radius = (h / 6) * .75;	//three quarters of the top blue part
    CGContextBeginPath(c);

    //rotate the star 180 degrees
    //CGContextRotateCTM(c, -180 *  M_PI / 180);
    

    //took MM's star code and inverted the operations on each center (+ became -)
    //Did this since rotate did not work as expected
    
    
    CGFloat theta = 0;
	
    CGContextMoveToPoint(c,    
                         center.x - radius * cosf(theta),
                         center.y + radius * sinf(theta)
                         );
    theta += 2 * M_PI * 2 / 5;		
	
    CGContextAddLineToPoint(c,
                            center.x - radius * cosf(theta),
                            center.y + radius * sinf(theta)
                            );
    
	theta += 2 * M_PI * 2 / 5;		
	CGContextAddLineToPoint(c,
                            center.x - radius * cosf(theta),
                            center.y + radius * sinf(theta)
                            );
    
	theta += 2 * M_PI * 2 / 5;		
	CGContextAddLineToPoint(c,
                            center.x - radius * cosf(theta),
                            center.y + radius * sinf(theta)
                            );
    
	theta += 2 * M_PI * 2 / 5;		
	CGContextAddLineToPoint(c,
                            center.x - radius * cosf(theta),
                            center.y + radius * sinf(theta)
                            );
    
	CGContextClosePath(c);


    
    CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
	CGContextFillPath(c);
    

    //add logo JPG file (just to be different) of UT mascot

	UIImage *image = [UIImage imageNamed: @"bevo.jpg"];   //160x100
	if (image == nil) {
		NSLog(@"where is the image?");
		return;
	}
    
		CGPoint point = CGPointMake(
                                0,
                                h - image.size.height
                                );
    
	[image drawAtPoint: point];









}


@end
