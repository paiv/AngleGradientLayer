//
//  UserControl6.m
//  AngleGradientSample
//
//  Created by Pavel Ivashkov on 2012-02-12.
//

#import "AngleGradientLayer.h"
#import "UserControl6.h"


@implementation UserControl6

+ (Class)layerClass
{
	return [AngleGradientLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
	if (!(self = [super initWithFrame:frame]))
		return nil;
	
	self.backgroundColor = [UIColor clearColor];
	
	NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:4];
	NSMutableArray *locations = [[NSMutableArray alloc] initWithCapacity:16];
	
	for (int i = 0; i < 6; i++) {
		[colors addObject:(id)[UIColor colorWithRed:1 green:1 blue:0 alpha:1].CGColor];
		[colors addObject:(id)[UIColor colorWithRed:1 green:1 blue:0 alpha:1].CGColor];
		[colors addObject:(id)[UIColor colorWithRed:1 green:100/255.0 blue:25/255.0 alpha:1].CGColor];
		[colors addObject:(id)[UIColor colorWithRed:1 green:100/255.0 blue:25/255.0 alpha:1].CGColor];
	}
	[colors addObject:(id)[UIColor colorWithRed:1 green:1 blue:0 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:1 green:1 blue:0 alpha:1].CGColor];
	
	const float fa[] = { 0, 4.0, 5, 29.0, 30, 49.0, 50, 74.0, 75, 104.0, 105, 134.0,
		135, 189.0, 190, 219.0, 220, 254.0, 255, 279.0, 280, 314.0, 315, 339.0, 340, 360 };
	for (int i = 0; i < sizeof(fa)/sizeof(fa[0]); i++)
		[locations addObject:[NSNumber numberWithFloat:fa[i] / 360.0]];
	
	AngleGradientLayer *l = (AngleGradientLayer *)self.layer;
	l.colors = colors;
	l.locations = locations;
	
//	l.cornerRadius = CGRectGetWidth(self.bounds) / 2;
//	self.clipsToBounds = YES;
	self.transform = CGAffineTransformMakeRotation(0.25 * M_PI_2);

	return self;
}


@end
