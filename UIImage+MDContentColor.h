//  UIImage+MDContentColor.h
//
//  Created by Mladen Djordjevic on 6/4/14.
//  Copyright (c) 2014 Topnotch Apps. All rights reserved.


#import <UIKit/UIKit.h>

/// Content colors
typedef NS_ENUM(NSUInteger, MDContentColor)
{
    /// The color is "light".
    MDContentColorLight,
    /// The color is "dark".
    MDContentColorDark
};

/**
 * A category for UIImage that adds methods to find average color and whether an image is "light" or "dark".
 */
@interface UIImage (MDContentColor)

/**
 * Returns the average color of the image.
 */
- (UIColor *)md_averageColor;

/**
 * Returns whether the image is "light" or "dark".
 */
- (MDContentColor)md_imageContentColor;

/**
 * Returns whether the image is "light" or "dark" given a darkness threshold.
 * The darkness threshold is a value from 0 to 1, where 0 is black and 1 is white.
 */
- (MDContentColor)md_imageContentColorWithDarknessThreshold:(CGFloat)threshold;

/**
 * Returns whether the given color is "light" or "dark".
 */
+ (MDContentColor)md_contentColorForUIColor:(UIColor *)color;

/**
 * Returns whether the given color is "light" or "dark" given a darkness threshold.
 * The darkness threshold is a value from 0 to 1, where 0 is black and 1 is white.
 */
+ (MDContentColor)md_contentColorForUIColor:(UIColor *)color darknessThreshold:(CGFloat)threshold;

@end
