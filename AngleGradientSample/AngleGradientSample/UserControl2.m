//
//  UserControl2.m
//  AngleGradientSample
//
//  Created by Pavel Ivashkov on 2012-02-12.
//

#import "AngleGradientLayer.h"
#import "UserControl2.h"


@implementation UserControl2

+ (Class)layerClass
{
	return [AngleGradientLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
	if (!(self = [super initWithFrame:frame]))
		return nil;
	
	self.backgroundColor = [UIColor whiteColor];
	
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
	
	AngleGradientLayer *l = (AngleGradientLayer *)self.layer;
	l.colors = colors;
	[colors release];
	
	l.cornerRadius = CGRectGetWidth(self.bounds) / 2;
	self.clipsToBounds = YES;
	l.borderColor = [UIColor colorWithWhite:0.55 alpha:1].CGColor;
	l.borderWidth = 1;
	
	return self;
}

@end
