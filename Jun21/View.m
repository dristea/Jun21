//
//  View.m
//  Jun21
//
//  Created by Dan Ristea on 6/20/12.
//  Copyright (c) 2012 NBS. All rights reserved.
//

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
		//Keep the size of the view the same,
		//but let the center of the view be the origin.
		/*CGFloat w = self.bounds.size.width;
		 CGFloat h = self.bounds.size.height;
		 self.bounds = CGRectMake(-w / 2, -h / 2, w, h);*/
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	// Drawing code
    // Drawing code
    CGRect bounds = self.bounds;
    CGFloat radius = .45 * bounds.size.width;	//in pixels
	CGFloat radius2 = .40 * bounds.size.width;	//in pixels
	
	CGSize size = self.bounds.size;
	CGFloat min = MIN(size.width, size.height);
	CGFloat longSide = min * 6 / 16;
	CGFloat shortSide = longSide / 2;
	
    
    /*
     Create the invisible square that will surround the circle.
     Place the upper left corner of the square at the upper left corner of
     the View.  bounds.origin.x and bounds.origin.y are the coordinates of
     the upper left corner of the View.
     */
	
	//black circle
	CGRect r = CGRectMake(
						  -radius,
						  -radius,
						  2 * radius,
						  2 * radius
						  );
    
    CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM(c, bounds.size.width / 2, bounds.size.height / 2);
	CGContextRotateCTM(c, -65.0 * M_PI / 180.0);
	
    CGContextBeginPath(c); //unnecessary here: the path is already empty.
    CGContextAddEllipseInRect(c, r);    
	CGContextSetRGBFillColor(c, 0.1, 0.0, 0.0, 1.0);	//black, opaque
	CGContextFillPath(c);
	
	//opening in black circle
	CGRect r2 = CGRectMake(
						   -radius2,
						   -radius2,
						   2*radius2,
						   2*radius2
						   );
	
	CGContextBeginPath(c); 
    CGContextAddEllipseInRect(c, r2);    
	//CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);	//white, opaque
	//CGContextFillPath(c);
	
	
	CGRect circumferenceBreak = CGRectMake(-120-longSide/2 , -39-shortSide/2 , longSide, shortSide);
	CGContextAddRect(c, circumferenceBreak);
	CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
	CGContextFillPath(c);	
	
	//the first and longer leg of A
	CGRect longBar = CGRectMake(-145-longSide/2 , -30-shortSide/2 , longSide*3.2, shortSide*.7);
	CGContextAddRect(c, longBar);
	//CGContextSetRGBFillColor(c, 0.1, 0.0, 0.0, 1.0);
    //CGContextFillPath(c);
	
	CGContextRotateCTM(c, 155.0 * M_PI / 180.0);
	//the second and shorter leg of A
	CGRect shortBar = CGRectMake(-135-longSide/2 , -40-shortSide/2 , longSide*2.3, shortSide*.7);
	CGContextAddRect(c, shortBar);
	//CGContextSetRGBFillColor(c, 0.1, 0.0, 0.0, 1.0);
    //CGContextFillPath(c);
	
	//the dash in A
	CGRect horizontalBar = CGRectMake(-longSide/2+63 , -shortSide/2 , longSide*.35, shortSide*1.3);
	CGContextAddRect(c, horizontalBar);
	CGContextSetRGBFillColor(c, 0.1, 0.0, 0.0, 1.0);
    CGContextFillPath(c);
	
	//first white stripe on the shorter leg of A
	CGContextRotateCTM(c, 133.0 * M_PI / 180.0);
	CGRect thinBar1 = CGRectMake(-longSide/2-25, -shortSide/2+60, longSide*.8, shortSide*.2);
	CGContextAddRect(c, thinBar1);
	//CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
    //CGContextFillPath(c);
	
	//second white stripe on the shorter leg of A
	CGContextRotateCTM(c, 93 * M_PI / 180.0);
	CGRect thinBar2 = CGRectMake(-longSide/2, -shortSide/2+95, longSide*.9, shortSide*.2);
	CGContextAddRect(c, thinBar2);
	//CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
    //CGContextFillPath(c);
	
	//flatening A's top edge with a white stripe
	CGContextRotateCTM(c, 44 * M_PI / 180.0);
	CGRect fillerBar1 = CGRectMake(-longSide/2+50, -shortSide/2-180, longSide*.9, shortSide*.5);
	CGContextAddRect(c, fillerBar1);
	//CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
    //CGContextFillPath(c);
	
	//flatening the bottom of A's first leg with a white stripe
	CGRect fillerBar2 = CGRectMake(-longSide/2-90, -shortSide/2+180, longSide*.9, shortSide*.6);
	CGContextAddRect(c, fillerBar2);
	CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
    CGContextFillPath(c);
	
}

@end
