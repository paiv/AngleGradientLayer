h2. AngleGradientLayer

*AngleGradientLayer* is a *CALayer* implementation of angle gradient.

!https://github.com/paiv/AngleGradientLayer/raw/master/screenshot.png(screenshot)!

h2. Sample usage with UIView

(See demo project for more.)

bc.. #import "AngleGradientLayer.h"

@interface MyView : UIView
@end

@implementation MyView

+ (Class)layerClass
{
	return [AngleGradientLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
	if (!(self = [super initWithFrame:frame]))
		return nil;

	AngleGradientLayer *l = (AngleGradientLayer *)self.layer;
	l.colors = [NSArray arrayWithObjects:
		(id)[UIColor colorWithRed:0 green:0 blue:0.5 alpha:1].CGColor,
		(id)[UIColor colorWithRed:1 green:1 blue:0.4 alpha:1].CGColor,
		nil];

	return self;
}

@end
