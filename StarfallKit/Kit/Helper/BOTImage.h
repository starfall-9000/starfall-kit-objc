//
//  WFCImage.h
//  WiFiChua
//
//  Created by Mac on 9/4/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface BOTImage : NSObject

+ (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size;
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (CGRect)frameFollowLeft:(CGRect)targetFrame withSize:(CGSize)size;
+ (CGRect)frameFollowLeft:(CGRect)targetFrame withWidth:(CGFloat)width;
+ (CGRect)frameFollowLeft:(CGRect)targetFrame;
+ (CGRect)frameFollowLeftWithFullWidth:(CGRect)targetFrame;
+ (CGRect)frameFollowTop:(CGRect)targetFrame withSize:(CGSize)size;
+ (CGRect)frameFollowTop:(CGRect)targetFrame withHeight:(CGFloat)height;
+ (CGRect)frameFollowTop:(CGRect)targetFrame;
+ (CGRect)frameFollowTopWithFullHeight:(CGRect)targetFrame;

@end
