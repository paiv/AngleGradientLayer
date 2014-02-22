//
// The MIT License (MIT)
//
// Copyright (C) 2012 Pavel Ivashkov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software
// and associated documentation files (the "Software"), to deal in the Software without restriction,
// including without limitation the rights to use, copy, modify, merge, publish, distribute,
// sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
// PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
// FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.
//
//  AngleGradientView.m
//  AngleGradientSample
//
//  Created by Caylan Larson on 2/22/14.
//  Copyright (c) 2014 Archer Software. All rights reserved.
//

#import "AngleGradientView.h"
#import "AngleGradientLayer.h"

@interface AngleGradientView ()

@property (strong, nonatomic) CALayer *maskLayer;

@end

@implementation AngleGradientView

@synthesize outlineBezierPath = _outlineBezierPath;

-(NSArray*)colors
{
    return self.angleGradientLayer.colors;
}

-(void)setColors:(NSArray*)colors
{
    self.angleGradientLayer.colors = colors;
    [self.angleGradientLayer setNeedsDisplay];
}

-(NSArray*)locations
{
    return self.angleGradientLayer.locations;
}

-(void)setLocations:(NSArray*)locations
{
    self.angleGradientLayer.locations = locations;
    [self.angleGradientLayer setNeedsDisplay];
}

-(AngleGradientLayer*)angleGradientLayer
{
    if(!_angleGradientLayer)
    {
        _angleGradientLayer = [AngleGradientLayer layer];
        _angleGradientLayer.frame = self.layer.bounds;
        [self.layer addSublayer:_angleGradientLayer];
    }
    
    return _angleGradientLayer;
}

-(void)setMaskBezierPath:(UIBezierPath *)maskBezierPath
{
    _maskBezierPath = maskBezierPath;
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = maskBezierPath.CGPath;
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    maskLayer.fillColor = [UIColor grayColor].CGColor;
    self.maskLayer = maskLayer;
}

-(void)setMaskLayer:(CALayer *)maskLayer
{
    [self.maskLayer removeFromSuperlayer];
    _maskLayer = maskLayer;
    [self.angleGradientLayer setMask:_maskLayer];
}

-(void)setOutlineBezierPath:(UIBezierPath *)outlineBezierPath
{
    [self setOutlineBezierPath:outlineBezierPath strokeColor:[UIColor blackColor] lineWidth:1];
}

-(void)setOutlineBezierPath:(UIBezierPath *)outlineBezierPath
                strokeColor:(UIColor*)strokeColor
                  lineWidth:(CGFloat)lineWidth
{
    _outlineBezierPath = outlineBezierPath;
    
    CAShapeLayer *outlineShapeLayer = [CAShapeLayer layer];
    outlineShapeLayer.path = outlineBezierPath.CGPath;
    outlineShapeLayer.strokeColor = strokeColor.CGColor;
    outlineShapeLayer.fillColor = [UIColor clearColor].CGColor;
    outlineShapeLayer.lineWidth = lineWidth;
    
    self.outlineLayer = outlineShapeLayer;
}

-(UIBezierPath*)outlineBezierPath
{
    if(!_outlineBezierPath)
        _outlineBezierPath = [self.maskBezierPath copy];
    
    return _outlineBezierPath;
}

-(void)setOutlineLayer:(CAShapeLayer *)outlineLayer
{
    [self.outlineLayer removeFromSuperlayer];
    _outlineLayer = outlineLayer;
    [self.layer addSublayer:_outlineLayer];
}

-(void)applyRoundMask
{
    self.maskBezierPath = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
}

-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    if(self.maskBezierPath)
        [self setOutlineBezierPath:self.outlineBezierPath
                       strokeColor:borderColor
                         lineWidth:self.outlineLayer.lineWidth];
    else
        self.layer.borderColor = borderColor.CGColor;
}

-(void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    if(self.maskBezierPath)
        [self setOutlineBezierPath:self.outlineBezierPath
                       strokeColor:[UIColor colorWithCGColor:self.outlineLayer.strokeColor]
                         lineWidth:borderWidth];
    else
        self.layer.borderWidth = borderWidth;
}

@end
