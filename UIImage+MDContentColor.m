//  UIImage+MDContentColor.m
//
//  Created by Mladen Djordjevic on 6/4/14.
//  Copyright (c) 2014 Topnotch Apps. All rights reserved.

#import "UIImage+MDContentColor.h"

static const CGFloat kMDRedMultiplier = 299.0f;
static const CGFloat kMDGreenMultiplier = 587.0f;
static const CGFloat kMDBlueMultiplier = 114.0f;
static const CGFloat kMDDarnessDivider = 1000.0f;
static const CGFloat kMDDefaultDarknessTheshold = .5f;

@implementation UIImage (MDContentColor)

- (UIColor *)md_averageColor
{
    CGSize size = {1, 1};
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(ctx, kCGInterpolationMedium);
    [self drawInRect:(CGRect){.size = size} blendMode:kCGBlendModeCopy alpha:1];
    uint8_t *data = CGBitmapContextGetData(ctx);
    UIColor *color = [UIColor colorWithRed:data[0] / 255.f green:data[1] / 255.f blue:data[2] / 255.f alpha:1];
    UIGraphicsEndImageContext();
    return color;
}

- (MDContentColor)md_imageContentColor
{
    return [self md_imageContentColorWithDarknessThreshold:kMDDefaultDarknessTheshold];
}

- (MDContentColor)md_imageContentColorWithDarknessThreshold:(CGFloat)threshold
{
    return [UIImage md_contentColorForUIColor:[self md_averageColor] darknessThreshold:threshold];
}

+ (MDContentColor)md_contentColorForUIColor:(UIColor *)color
{
    return [self md_contentColorForUIColor:color darknessThreshold:kMDDefaultDarknessTheshold];
}

+ (MDContentColor)md_contentColorForUIColor:(UIColor *)color darknessThreshold:(CGFloat)threshold
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat darknessScore = ((components[0] * 255.0f * kMDRedMultiplier) + (components[1] * 255.0f * kMDGreenMultiplier) + (components[2] * 255.0f * kMDBlueMultiplier)) / kMDDarnessDivider;
    if (darknessScore >= (threshold * 255.0f)) {
        return MDContentColorLight;
    }
    return MDContentColorDark;
}

@end
