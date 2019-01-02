//
//  Formatter.m
//  WiFiChua
//
//  Created by Mac on 9/6/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "BOTFormatter.h"
@import SystemConfiguration.CaptiveNetwork;

static CGFloat const DEFAULT_DEVICE_WID = 414;
static CGFloat const DEFAULT_DEVICE_HEI = 736;

@implementation BOTFormatter

+ (BOTFormatter *)tempInstance {
    BOTFormatter *temp = [[BOTFormatter alloc] init];
    
    return temp;
}

#pragma mark Device Infomation
+ (CGRect)screenBounds {
    return [[UIScreen mainScreen] bounds];
}

+ (CGFloat)screenWidth {
    return [self screenBounds].size.width;
}

+ (CGFloat)screenHeight {
    return [self screenBounds].size.height;
}

+ (CGFloat)formatSizeForDevice:(CGFloat)size
{
    CGSize screenSize = [self screenBounds].size;
    CGFloat scale = (screenSize.width/DEFAULT_DEVICE_WID < screenSize.height/DEFAULT_DEVICE_HEI) ? screenSize.width/DEFAULT_DEVICE_WID : screenSize.height/DEFAULT_DEVICE_HEI;
    return size * scale;
}

+ (NSNumber *)unixTime {
    return [NSNumber numberWithInt:[[NSDate date] timeIntervalSince1970]];
}

+ (NSString *)thisYear {
    return [BOTFormatter stringFromDate:[NSDate date] withFormat:@"yyyy"];
}

+ (NSString *)deviceID {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

+ (NSDictionary *)ssidInfo {
    NSArray *interfaceNames = CFBridgingRelease(CNCopySupportedInterfaces());
    
    NSDictionary *SSIDInfo;
    for (NSString *interfaceName in interfaceNames) {
        SSIDInfo = CFBridgingRelease(
                                     CNCopyCurrentNetworkInfo((__bridge CFStringRef)interfaceName));
        
        BOOL isNotEmpty = (SSIDInfo.count > 0);
        if (isNotEmpty) {
            break;
        }
    }
    return SSIDInfo;
}

+ (NSString *)osVersion {
    return [[UIDevice currentDevice] systemVersion];
}

#pragma mark App Information
+ (NSDictionary *)infoDictionary {
    return [[NSBundle mainBundle] infoDictionary];
}

+ (NSString *)appVersion {
    return [NSString stringWithFormat:@"%@.%@", [[self infoDictionary] objectForKey:@"CFBundleShortVersionString"], [[self infoDictionary] objectForKey:@"CFBundleVersion"]];
}

#pragma mark Default Format
+ (UIColor *)defaultColor {
    return [UIColor colorWithRed:40/255.0 green:179/255.0 blue:224/255.0 alpha:0.7];
}

+ (NSDate *)dateFromString:(NSString *)date withFormat:(NSString *)stringFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:stringFormat];
    NSDate *dateFromString = [dateFormatter dateFromString:date];
    
    return dateFromString;
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)stringFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:stringFormat];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

+ (NSNumber *)numberFromString:(NSString *)strNumber
{
    return [[[NSNumberFormatter alloc] init] numberFromString:strNumber];
}

+ (NSString *)decimalNumber:(NSNumber *)number {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle]; // this line is important!
    
    NSString *formatted = [formatter stringFromNumber:number];
    
    return formatted;
}

+ (NSString *)stringByDecodingURLFormat:(NSString *)string {
    NSString *result = [string stringByReplacingOccurrencesOfString:@"+" withString:@" "];
//    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    result = [result stringByRemovingPercentEncoding];
    return result;
}

+ (NSString *)formatString:(NSString *)string toCase:(StringFormatCase)formatCase {
    NSString *format = string;
    if ([self isConstCase:string]) format = format.lowercaseString;
    
    // remove all white space
    format = [format stringByReplacingOccurrencesOfString:@" " withString:@""];
    // lower case first character
    format = [format stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[format substringToIndex:1] lowercaseString]];
    // camel to under score
    format = [self camelToUnderScore:format];
    // kebab to under score
    format = [format stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    
    switch (formatCase) {
        case StringFormatCaseUnderScore:
            return format;
            break;
        case StringFormatCaseKebab:
            return [format stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
            break;
        case StringFormatCaseConst:
            return [format uppercaseString];
            break;
        case StringFormatCaseCamel:
            return [self underScoreToCamel:format];
            break;
        case StringFormatCasePascal:
            format = [self underScoreToCamel:format];
            format = [format stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[format substringToIndex:1] uppercaseString]];
            return format;
            break;
        case StringFormatCaseName:
            return [self underScoreToName:format];
            break;
        default:
            return format;
            break;
    }
    
}

+ (BOOL)isConstCase:(NSString *)string {
    return [string.uppercaseString isEqualToString:string];
}

+ (NSString *)camelToUnderScore:(NSString *)string {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(?<=[a-z])([A-Z])|([A-Z])(?=[a-z])" options:0 error:nil];
    NSString *underscoreString = [[regex stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, string.length) withTemplate:@"_$1$2"] lowercaseString];
    return underscoreString;
}

+ (NSString *)underScoreToCamel:(NSString *)string {
    NSArray *listWord = [string componentsSeparatedByString:@"_"];
    NSMutableString *camelCaseString = [NSMutableString string];
    [listWord enumerateObjectsUsingBlock:^(NSString *component, NSUInteger idx, BOOL *stop) {
        [camelCaseString appendString:(idx == 0 ? component : [component capitalizedString])];
    }];
    return [camelCaseString copy];
}

+ (NSString *)underScoreToName:(NSString *)string {
    NSArray *listWord = [string componentsSeparatedByString:@"_"];
    NSMutableString *camelCaseString = [NSMutableString string];
    [listWord enumerateObjectsUsingBlock:^(NSString *component, NSUInteger idx, BOOL *stop) {
        [camelCaseString appendString:[component capitalizedString]];
        if (idx < [listWord count] - 1) [camelCaseString appendString:@" "];
    }];
    return [camelCaseString copy];
}

#pragma mark get window
+ (UIViewController *)topMostViewController
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    return topController;
}

+ (UIWindow *)findWindow {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (window == nil || window.windowLevel != UIWindowLevelNormal) {
        for (window in [UIApplication sharedApplication].windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                break;
            }
        }
    }
    return window;
}

@end
