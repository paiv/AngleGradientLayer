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
//  AngleGradientView.h
//  AngleGradientSample
//
//  Created by Caylan Larson on 2/22/14.
//  Copyright (c) 2014 Archer Software. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AngleGradientLayer;

#define DEMO_DRAGGABLE 1

#ifdef DEMO_DRAGGABLE
#define ANGLE_GRADIENT_SUPERCLASS UIControl
#else
#define ANGLE_GRADIENT_SUPERCLASS UIView
#endif

@interface AngleGradientView : ANGLE_GRADIENT_SUPERCLASS

@property(strong, nonatomic) AngleGradientLayer *angleGradientLayer;
@property(strong, nonatomic) NSArray *colors;
@property(strong, nonatomic) NSArray *locations;

@end
