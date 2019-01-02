//
//  BOTLogger.h
//  BaseObjectTest
//
//  Created by Mac on 2/8/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BOTLogger : NSObject

+ (void)logItem:(id)item fromSender:(id)sender;
+ (void)logViewFrame:(UIView *)view fromSender:(id)sender;
+ (void)logMessage:(NSString *)message fromSender:(id)sender;
+ (void)logError:(NSError *)error fromSender:(id)sender;
+ (void)logAllViewControllerFromSender:(id)sender;
+ (void)logAllView:(UIView *)view FromSender:(id)sender;
+ (void)logAllFont:(NSString *)familyName fromSender:(id)sender;

@end
