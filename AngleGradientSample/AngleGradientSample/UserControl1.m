//
//  UserControl1.m
//  AngleGradientSample
//
//  Created by Pavel Ivashkov on 2012-02-12.
//

#import "UserControl1.h"

@implementation UserControl1


- (id)initWithFrame:(CGRect)frame
{
	if (!(self = [super initWithFrame:frame]))
		return nil;
    
    self.backgroundColor = [UIColor whiteColor];
		
	NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:16];
	NSMutableArray *locations = [[NSMutableArray alloc] initWithCapacity:16];
	
	for (int i = 0; i < 5; i++) {
		[colors addObject:(id)[UIColor colorWithRed:252/255.0 green:253/255.0 blue:203/255.0 alpha:1].CGColor];
		[colors addObject:(id)[UIColor colorWithRed:250/255.0 green:96/255.0 blue:53/255.0 alpha:1].CGColor];
		[locations addObject:[NSNumber numberWithFloat:(0.2 * i)]];
		[locations addObject:[NSNumber numberWithFloat:(0.2 * i + 0.16)]];
	}
	[colors addObject:(id)[UIColor colorWithRed:252/255.0 green:253/255.0 blue:203/255.0 alpha:1].CGColor];
	[locations addObject:[NSNumber numberWithInt:1]];
	
	self.colors = colors;
	self.locations = locations;
    
	return self;
}


@end
