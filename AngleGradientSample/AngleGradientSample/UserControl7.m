//
//  UserControl7.m
//  AngleGradientSample
//
//  Created by Caylan Larson on 2/22/14.
//  Copyright (c) 2014 Archer Software. All rights reserved.
//

#import "UserControl7.h"
#import "AngleGradientLayer.h"

@implementation UserControl7

- (id)initWithFrame:(CGRect)frame
{
	if (!(self = [super initWithFrame:frame]))
		return nil;
    
	NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:4];
    [colors addObject:(id)[UIColor whiteColor].CGColor];
    [colors addObject:(id)[UIColor purpleColor].CGColor];
    [colors addObject:(id)[UIColor yellowColor].CGColor];
    [colors addObject:(id)[UIColor blackColor].CGColor];
    [colors addObject:(id)[UIColor whiteColor].CGColor];
    
    NSMutableArray *locations = [[NSMutableArray alloc] initWithCapacity:4];
    [locations addObject:@(0)];
    [locations addObject:@(.25)];
    [locations addObject:@(0.5)];
    [locations addObject:@(0.75)];
    [locations addObject:@(1)];
	
	self.colors = colors;
	self.locations = locations;
    
    UIBezierPath *bigCirclePath = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    UIBezierPath *smallCirclePath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.bounds, 20, 20)];
    [bigCirclePath appendPath:smallCirclePath];
    [bigCirclePath setUsesEvenOddFillRule:YES];
    self.maskBezierPath = bigCirclePath;
    
    self.borderColor = [UIColor whiteColor];
    self.borderWidth = 5;
    
    CABasicAnimation * spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	spin.duration = 3;
	spin.toValue = [NSNumber numberWithFloat:-M_PI];
	spin.cumulative = YES;
	spin.repeatCount = MAXFLOAT;
	[self.angleGradientLayer addAnimation:spin forKey:@"spin"];
    
	return self;
}

@end
