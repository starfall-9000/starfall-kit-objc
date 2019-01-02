//
//  BOTAlert.h
//  GlobalInnovation
//
//  Created by starfall on 9/27/17.
//  Copyright © 2017 GlobalInnovation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BOTAlert : NSObject

+ (UIAlertController *)alertMessage:(NSString *)message parent:(UIViewController *)parent;
+ (UIAlertController *)alertMessage:(NSString *)message parent:(UIViewController *)parent dismissAction:(void (^)(UIAlertAction *action))dismiss;
+ (UIAlertController *)alertMessage:(NSString *)message parent:(UIViewController *)parent dismissAction:(void (^)(UIAlertAction *action))dismiss confirmAction:(void(^)(UIAlertAction *action))confirm;
+ (UIAlertController *)delayAlertMessage:(NSString *)message parent:(UIViewController *)parent;
+ (UIAlertController *)notiAlertMessage:(NSString *)message parent:(UIViewController *)parent;
+ (UIAlertController *)notiAlertMessage:(NSString *)message parent:(UIViewController *)parent dismissAction:(void (^)(void))completion;
+ (UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message emailText:(NSString *)placeholder parent:(UIViewController *)parent confirm:(void (^)(UIAlertAction *))confirm;

@end
