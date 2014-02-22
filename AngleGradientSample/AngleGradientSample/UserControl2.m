//
//  UserControl2.m
//  AngleGradientSample
//
//  Created by Pavel Ivashkov on 2012-02-12.
//

#import "UserControl2.h"

@implementation UserControl2

- (id)initWithFrame:(CGRect)frame
{
	if (!(self = [super initWithFrame:frame]))
		return nil;

	NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:16];
	
	[colors addObject:(id)[UIColor colorWithWhite:0.65 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithWhite:0.9 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithWhite:0.75 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithWhite:0.35 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithWhite:0.75 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithWhite:0.9 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithWhite:0.75 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithWhite:0.35 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithWhite:0.55 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithWhite:0.65 alpha:1].CGColor];
	
	self.colors = colors;
	
    [self applyRoundMask];
    self.borderColor = [UIColor grayColor];
    self.borderWidth = 1;
	
	return self;
}

@end
