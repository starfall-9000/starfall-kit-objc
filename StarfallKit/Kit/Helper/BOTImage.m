//
//  WFCImage.m
//  WiFiChua
//
//  Created by Mac on 9/4/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "BOTImage.h"

@implementation BOTImage

#pragma mark Custom Image
+ (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *imageResult = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageResult;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark Custom Frame
+ (CGRect)frameFollowLeft:(CGRect)targetFrame withSize:(CGSize)size {
    return CGRectMake(CGRectGetMaxX(targetFrame), targetFrame.origin.y, size.width, size.height);
}

+ (CGRect)frameFollowLeft:(CGRect)targetFrame withWidth:(CGFloat)width {
    return [self frameFollowLeft:targetFrame withSize:CGSizeMake(width, CGRectGetHeight(targetFrame))];
}

+ (CGRect)frameFollowLeft:(CGRect)targetFrame {
    return [self frameFollowTop:targetFrame withSize:targetFrame.size];
}

+ (CGRect)frameFollowLeftWithFullWidth:(CGRect)targetFrame {
//    return [self frameFollowLeft:targetFrame withWidth:[WFCFormatter screenWidth] - CGRectGetMaxX(targetFrame)];
    return CGRectZero;
}

+ (CGRect)frameFollowTop:(CGRect)targetFrame withSize:(CGSize)size {
    return CGRectMake(targetFrame.origin.x, CGRectGetMaxY(targetFrame), size.width, size.height);
}

+ (CGRect)frameFollowTop:(CGRect)targetFrame withHeight:(CGFloat)height {
    return [self frameFollowTop:targetFrame withSize:CGSizeMake(CGRectGetWidth(targetFrame), height)];
}

+ (CGRect)frameFollowTop:(CGRect)targetFrame {
    return [self frameFollowTop:targetFrame withSize:targetFrame.size];
}

+ (CGRect)frameFollowTopWithFullHeight:(CGRect)targetFrame {
//    return [self frameFollowTop:targetFrame withHeight:[WFCFormatter screenHeight] - CGRectGetMaxY(targetFrame)];
    return CGRectZero;
}

@end
