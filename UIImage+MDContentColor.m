//  UIImage+MDContentColor.m
//
//  Created by Mladen Djordjevic on 6/4/14.
//  Copyright (c) 2014 Topnotch Apps. All rights reserved.

#import "UIImage+MDContentColor.h"

#define kMDRedMultiplier 299
#define kMDGreenMultiplier 587
#define kMDBlueMultiplier 114
#define kMDDarnessDivider 1000
#define kMDDarnessBorder 125

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
    return [UIImage md_contentColorForUIColor:[self md_averageColor]];
}

+ (MDContentColor)md_contentColorForUIColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat darknessScore = ((components[0] * 255 * kMDRedMultiplier) + (components[1] * 255 * kMDGreenMultiplier) + (components[2] * 255 * kMDBlueMultiplier)) / kMDDarnessDivider;
    if (darknessScore >= kMDDarnessBorder) {
        return MDContentColorLight;
    }
    return MDContentColorDark;
}

@end
