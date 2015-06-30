# AngleGradientLayer

[![cocoapods](https://img.shields.io/cocoapods/v/AngleGradientLayer.svg)](https://cocoapods.org/pods/AngleGradientLayer)
[![build status](https://img.shields.io/travis/paiv/AngleGradientLayer.svg)](https://travis-ci.org/paiv/AngleGradientLayer)

**AngleGradientLayer** is a **CALayer** implementation of angle gradient.

![screenshot](https://github.com/paiv/AngleGradientLayer/raw/master/screenshot.png)

## Installing

```ruby
pod 'AngleGradientLayer', '~> 1.0'
```

## [Swift] Using in your code

```swift
import AngleGradientLayer

class MyView: UIView {

    override class func layerClass() -> AnyClass {
        return AngleGradientLayer.self
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        let l: AngleGradientLayer = self.layer as! AngleGradientLayer
        l.colors = [
            UIColor(red: 0, green: 0, blue: 0.5, alpha: 1).CGColor,
            UIColor(red: 1, green: 1, blue: 0.4, alpha: 1).CGColor]
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

## Notes

When working with semi-transparent views, be sure to set `backgroundColor` property on the layer's view

```swift
myview.backgroundColor = UIColor.clearColor()
```

`backgroundColor` by default is `nil`, blending to black color.
