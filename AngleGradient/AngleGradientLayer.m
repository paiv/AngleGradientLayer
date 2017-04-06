//
// The MIT License (MIT)
// 
// Copyright (C) 2012 Pavel Ivashkov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this
// software and associated documentation files (the "Software"), to deal in the Software
// without restriction, including without limitation the rights to use, copy, modify, merge,
// publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons
// to whom the Software is furnished to do so, subject to the following conditions:
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
//
//  AngleGradientLayer.m
//  paiv
//
//  Created by Pavel Ivashkov on 2012-02-12.
//

#import "AngleGradientLayer.h"

#if __has_feature(objc_arc)
#define BRIDGE_CAST(T) (__bridge T)
#else
#define BRIDGE_CAST(T) (T)
#endif

#define byte unsigned char
#define F2CC(x) ((byte)(255 * x))
#define RGBAF(r,g,b,a) (F2CC(r) << 24 | F2CC(g) << 16 | F2CC(b) << 8 | F2CC(a))
#define RGBA(r,g,b,a) ((byte)r << 24 | (byte)g << 16 | (byte)b << 8 | (byte)a)
#define RGBA_R(c) ((uint)c >> 24 & 255)
#define RGBA_G(c) ((uint)c >> 16 & 255)
#define RGBA_B(c) ((uint)c >> 8 & 255)
#define RGBA_A(c) ((uint)c >> 0 & 255)

@interface AngleGradientLayer()

- (CGImageRef)newImageGradientInRect:(CGRect)rect;

@end


static void angleGradient(byte* data, int w, int h, int* colors, int colorCount, float* locations, int locationCount);


@implementation AngleGradientLayer

- (id)init
{
	if (!(self = [super init]))
		return nil;
	
	self.needsDisplayOnBoundsChange = YES;
	
	return self;
}

#if !__has_feature(objc_arc)
- (void)dealloc
{
	[_colors release];
	[_locations release];
	[super dealloc];
}
#endif

- (void)drawInContext:(CGContextRef)ctx
{
	CGContextSetFillColorWithColor(ctx, self.backgroundColor);
    CGContextRotateCTM(ctx, self.startAngle);
    if (self.clockWise)
    {
        CGAffineTransform flipVertical = CGAffineTransformMake(
                                                               1, 0, 0, -1, 0,
                                                               self.bounds.size.width
                                                               );
        CGContextConcatCTM(ctx, flipVertical);
    }
	CGRect rect = CGContextGetClipBoundingBox(ctx);
	CGContextFillRect(ctx, rect);

	CGImageRef img = [self newImageGradientInRect:rect];
	CGContextDrawImage(ctx, rect, img);
	CGImageRelease(img);
}

- (CGImageRef)newImageGradientInRect:(CGRect)rect
{
    return [[self class] newImageGradientInRect:rect colors:self.colors locations:self.locations];
}

+ (CGImageRef)newImageGradientInRect:(CGRect)rect colors:(NSArray *)colors locations:(NSArray *)locations
{
	int w = CGRectGetWidth(rect);
	int h = CGRectGetHeight(rect);
	int bitsPerComponent = 8;
	int bpp = 4 * bitsPerComponent / 8;
	int byteCount = w * h * bpp;
	
	int colorCount = (int)colors.count;
	int locationCount = (int)locations.count;
	int* cols = NULL;
	float* locs = NULL;
	
	if (colorCount > 0) {
		cols = calloc(colorCount, bpp);
		int *p = cols;
		for (id cg in colors) {
			CGColorRef c = BRIDGE_CAST(CGColorRef)cg;
			float r, g, b, a;
			
			size_t n = CGColorGetNumberOfComponents(c);
			const CGFloat *comps = CGColorGetComponents(c);
			if (comps == NULL) {
				*p++ = 0;
				continue;
			}
			r = comps[0];
			if (n >= 4) {
				g = comps[1];
				b = comps[2];
				a = comps[3];
			}
			else {
				g = b = r;
				a = comps[1];
			}
			*p++ = RGBAF(r, g, b, a);
		}
	}
	if (locationCount > 0 && locationCount == colorCount) {
		locs = calloc(locationCount, sizeof(locs[0]));
		float *p = locs;
		for (NSNumber *n in locations) {
			*p++ = [n floatValue];
		}
	}
	
	byte* data = malloc(byteCount);
	angleGradient(data, w, h, cols, colorCount, locs, locationCount);
	
	if (cols) free(cols);
	if (locs) free(locs);
	
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Little;
	CGContextRef ctx = CGBitmapContextCreate(data, w, h, bitsPerComponent, w * bpp, colorSpace, bitmapInfo);
	CGColorSpaceRelease(colorSpace);
	CGImageRef img = CGBitmapContextCreateImage(ctx);
	CGContextRelease(ctx);
	free(data);
	return img;
}

@end

static inline byte blerp(byte a, byte b, float w)
{
	return a + w * (b - a);
}
static inline int lerp(int a, int b, float w)
{
	return RGBA(blerp(RGBA_R(a), RGBA_R(b), w),
				blerp(RGBA_G(a), RGBA_G(b), w),
				blerp(RGBA_B(a), RGBA_B(b), w),
				blerp(RGBA_A(a), RGBA_A(b), w));
}
static inline int multiplyByAlpha(int c)
{
	float a = RGBA_A(c) / 255.0;
	return RGBA((byte)(RGBA_R(c) * a),
				(byte)(RGBA_G(c) * a),
				(byte)(RGBA_B(c) * a),
				RGBA_A(c));
}

void angleGradient(byte* data, int w, int h, int* colors, int colorCount, float* locations, int locationCount)
{
	if (colorCount < 1) return;
	if (locationCount > 0 && locationCount != colorCount) return;
	
	int* p = (int*)data;
	float centerX = (float)w / 2;
	float centerY = (float)h / 2;
	
	for (int y = 0; y < h; y++)
	for (int x = 0; x < w; x++) {
		float dirX = x - centerX;
		float dirY = y - centerY;
		float angle = atan2f(dirY, dirX);
		if (dirY < 0) angle += 2 * M_PI;
		angle /= 2 * M_PI;
		
		int index = 0, nextIndex = 0;
		float t = 0;
		
		if (locationCount > 0) {
			for (index = locationCount - 1; index >= 0; index--) {
				if (angle >= locations[index]) {
					break;
				}
			}
			if (index >= locationCount) index = locationCount - 1;
			nextIndex = index + 1;
			if (nextIndex >= locationCount) nextIndex = locationCount - 1;
			float ld = locations[nextIndex] - locations[index];
			t = ld <= 0 ? 0 : (angle - locations[index]) / ld;
		}
		else {
			t = angle * (colorCount - 1);
			index = t;
			t -= index;
			nextIndex = index + 1;
			if (nextIndex >= colorCount) nextIndex = colorCount - 1;
		}
		
		int lc = colors[index];
		int rc = colors[nextIndex];
		int color = lerp(lc, rc, t);
		color = multiplyByAlpha(color);
		*p++ = color;
	}
}
