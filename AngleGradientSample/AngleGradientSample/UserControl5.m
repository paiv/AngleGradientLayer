//
//  UserControl5.m
//  AngleGradientSample
//
//  Created by Pavel Ivashkov on 2012-02-12.
//

#import "UserControl5.h"

@implementation UserControl5

- (id)initWithFrame:(CGRect)frame
{
	if (!(self = [super initWithFrame:frame]))
		return nil;
		
	NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:4];
	NSMutableArray *locations = [[NSMutableArray alloc] initWithCapacity:16];
	
	[colors addObject:(id)[UIColor colorWithRed:1 green:0 blue:0 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:1 green:0 blue:0 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:1 green:1 blue:0 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:1 green:1 blue:0 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:0 green:1 blue:0 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:0 green:1 blue:0 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:0 green:1 blue:1 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:0 green:1 blue:1 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:0 green:0 blue:1 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:0 green:0 blue:1 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:1 green:0 blue:1 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:1 green:0 blue:1 alpha:1].CGColor];
	
	[locations addObject:[NSNumber numberWithInt:0]];
	[locations addObject:[NSNumber numberWithFloat:0.158]];
	[locations addObject:[NSNumber numberWithFloat:0.16]];
	[locations addObject:[NSNumber numberWithFloat:0.328]];
	[locations addObject:[NSNumber numberWithFloat:0.33]];
	[locations addObject:[NSNumber numberWithFloat:0.498]];
	[locations addObject:[NSNumber numberWithFloat:0.50]];
	[locations addObject:[NSNumber numberWithFloat:0.658]];
	[locations addObject:[NSNumber numberWithFloat:0.66]];
	[locations addObject:[NSNumber numberWithFloat:0.838]];
	[locations addObject:[NSNumber numberWithFloat:0.84]];
	[locations addObject:[NSNumber numberWithInt:1]];
	
	self.colors = colors;
	self.locations = locations;

	[self applyRoundMask];
	
	return self;
}

@end
