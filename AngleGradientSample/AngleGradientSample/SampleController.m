//
//  SampleController.m
//  AngleGradientSample
//
//  Created by Pavel Ivashkov on 2012-02-11.
//

#import <QuartzCore/QuartzCore.h>
#import "SampleController.h"
#import "UserControl1.h"
#import "UserControl2.h"
#import "UserControl3.h"
#import "UserControl4.h"
#import "UserControl5.h"
#import "UserControl6.h"


@interface SampleController()

@property(strong, nonatomic) UIControl *uc5;

@end


@implementation SampleController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (!(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
		return nil;
	return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)handleDragInside:(UIControl *)control withEvent:(UIEvent *)event
{
	[control.superview bringSubviewToFront:control];
	control.center = [[[event allTouches] anyObject] locationInView:control.superview];
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
	CGRect rect = [UIScreen mainScreen].applicationFrame;
	UIScrollView *v = [[UIScrollView alloc] initWithFrame:rect];
	v.backgroundColor = [UIColor whiteColor];

	UserControl1 *uc1 = [[UserControl1 alloc] initWithFrame:v.bounds];
	[v addSubview:uc1];
	
	UserControl2 *uc2 = [[UserControl2 alloc] initWithFrame:CGRectMake(5, 5, 88, 88)];
	[v addSubview:uc2];
	
	UserControl3 *uc3 = [[UserControl3 alloc] initWithFrame:CGRectMake(155, 95, 66, 66)];
	[v addSubview:uc3];
	
	UserControl4 *uc4 = [[UserControl4 alloc] initWithFrame:CGRectMake(190, 305, 120, 120)];
	[v addSubview:uc4];
	
	_uc5 = [[UserControl5 alloc] initWithFrame:CGRectMake(15, 335, 100, 100)];
	[v addSubview:_uc5];
	
	UserControl6 *uc6 = [[UserControl6 alloc] initWithFrame:CGRectMake(-10, 225, 135, 135)];
	[v addSubview:uc6];

	v.contentSize = uc1.frame.size;
	self.view = v;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	for (UIView *v in self.view.subviews) {
		if (![v isKindOfClass:[UIControl class]]) continue;
		[(UIControl *)v addTarget:self action:@selector(handleDragInside:withEvent:) forControlEvents:UIControlEventTouchDragInside];
	}

	CABasicAnimation * spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	spin.duration = 1;
	spin.toValue = [NSNumber numberWithFloat:M_PI];
	spin.cumulative = YES;
	spin.repeatCount = MAXFLOAT;
	[self.uc5.layer addAnimation:spin forKey:@"spin"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;

	self.uc5 = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
