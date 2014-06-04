//  UIImage+MDContentColor.h
//
//  Created by Mladen Djordjevic on 6/4/14.
//  Copyright (c) 2014 Topnotch Apps. All rights reserved.


#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MDContentColor)
{
    MDContentColorLight,
    MDContentColorDark
};

@interface UIImage (MDContentColor)

- (UIColor *)md_averageColor;
- (MDContentColor)md_imageContentColor;

+ (MDContentColor)md_contentColorForUIColor:(UIColor *)color;

@end
