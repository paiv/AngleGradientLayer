//
//  UserControl3.m
//  AngleGradientSample
//
//  Created by Pavel Ivashkov on 2012-02-12.
//

#import "UserControl3.h"

@implementation UserControl3

- (id)initWithFrame:(CGRect)frame
{
	if (!(self = [super initWithFrame:frame]))
		return nil;
	
	self.backgroundColor = [UIColor whiteColor];
	
	NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:16];
	
	[colors addObject:(id)[UIColor colorWithRed:0 green:0 blue:0.5 alpha:1].CGColor];
	[colors addObject:(id)[UIColor colorWithRed:1 green:1 blue:0.4 alpha:1].CGColor];
	
	self.colors = colors;
		
	self.transform = CGAffineTransformMakeRotation(0.75 * M_PI);
	
    self.borderColor = [UIColor blueColor];
    self.borderWidth = 3;
    
	return self;
}

@end
