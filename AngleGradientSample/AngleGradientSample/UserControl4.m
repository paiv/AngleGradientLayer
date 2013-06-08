//
//  UserControl4.m
//  AngleGradientSample
//
//  Created by Pavel Ivashkov on 2012-02-12.
//

#import "AngleGradientLayer.h"
#import "UserControl4.h"


@implementation UserControl4

+ (Class)layerClass
{
	return [AngleGradientLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
	if (!(self = [super initWithFrame:frame]))
		return nil;
	
	self.backgroundColor = [UIColor whiteColor];
	
	NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:4];
	
	[colors addObject:(id)[UIColor colorWithRed:1 green:0 blue:0 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:1 green:1 blue:0 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:0 green:1 blue:0 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:0 green:1 blue:1 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:0 green:0 blue:1 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:1 green:0 blue:1 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:1 green:0 blue:0 alpha:1].CGColor];
	
	AngleGradientLayer *l = (AngleGradientLayer *)self.layer;
	l.colors = colors;
	
	l.cornerRadius = CGRectGetWidth(self.bounds) / 2;
	self.clipsToBounds = YES;
	self.transform = CGAffineTransformMakeRotation(-M_PI_2);
	
	return self;
}

@end
