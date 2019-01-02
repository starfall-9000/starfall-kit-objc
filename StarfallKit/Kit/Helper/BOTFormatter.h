//
//  Formatter.h
//  WiFiChua
//
//  Created by Mac on 9/6/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum StringFormatCase: NSInteger {
    StringFormatCaseCamel,
    StringFormatCaseUnderScore,
    StringFormatCaseKebab,
    StringFormatCasePascal,
    StringFormatCaseName,
    StringFormatCaseConst
} StringFormatCase;

@interface BOTFormatter : NSObject

#pragma mark Device Information
+ (CGRect)screenBounds;
+ (CGFloat)screenWidth;
+ (CGFloat)screenHeight;
+ (NSNumber *)unixTime;
+ (NSString *)thisYear;
+ (NSString *)deviceID;
+ (NSDictionary *)ssidInfo;
+ (NSString *)osVersion;
#pragma mark App Information
+ (NSDictionary *)infoDictionary;
+ (NSString *)appVersion;
#pragma mark Default Format
+ (UIColor *)defaultColor;
+ (NSDate *)dateFromString:(NSString *)date withFormat:(NSString *)stringFormat;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)stringFormat;
+ (CGFloat)formatSizeForDevice:(CGFloat)size;
+ (NSNumber *)numberFromString:(NSString *)strNumber;
+ (NSString *)decimalNumber:(NSNumber *)number;
+ (NSString *)stringByDecodingURLFormat:(NSString *)string;
+ (NSString *)formatString:(NSString *)string toCase:(StringFormatCase)formatCase; // camelCase, PascalCase, under_score, Name Case
#pragma mark Get Screen
+ (UIViewController *)topMostViewController;
+ (UIWindow *)findWindow;

@end
