# AngleGradientLayer

**AngleGradientLayer** is a **CALayer** implementation of angle gradient.

![screenshot](https://github.com/paiv/AngleGradientLayer/raw/master/screenshot.png)

## [Swift] Using in your code

```swift
class MyView: UIView {

    override class func layerClass() -> AnyClass {
        return AngleGradientLayer.self
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        let l: AngleGradientLayer = self.layer as AngleGradientLayer
        let colors: Array<AnyObject> = [
            UIColor(red: 0, green: 0, blue: 0.5, alpha: 1).CGColor,
            UIColor(red: 1, green: 1, blue: 0.4, alpha: 1).CGColor]
        l.colors = colors
    }
}
```

## [Objective-C] Using in your code

(See demo project for more.)

```objective-c
#import "AngleGradientLayer.h"

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
```
