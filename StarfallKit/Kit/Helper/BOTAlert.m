//
//  BOTAlert.m
//  GlobalInnovation
//
//  Created by starfall on 9/27/17.
//  Copyright © 2017 GlobalInnovation. All rights reserved.
//

#import "BOTAlert.h"

@implementation BOTAlert

#pragma mark base
+ (UIAlertController *)baseAlertView:(NSString *)title :(NSString *)message {
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    return alertView;
}

+ (void)addDismissAction1:(UIAlertController *)alertController handler:(void (^)(UIAlertAction *))handler {
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:handler];
    
    [alertController addAction:action];
}

+ (void)addDismissAction2:(UIAlertController *)alertController handler:(void (^)(UIAlertAction *))handler {
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:handler];
    
    [alertController addAction:action];
}

#pragma mark public method
+ (UIAlertController *)alertMessage:(NSString *)message parent:(UIViewController *)parent {
    return [self alertMessage:message parent:parent dismissAction:nil];
}

+ (UIAlertController *)alertMessage:(NSString *)message parent:(UIViewController *)parent dismissAction:(void (^)(UIAlertAction *))dismiss {
    return [self alertMessage:message parent:parent dismissAction:dismiss confirmAction:nil];
}

+ (UIAlertController *)alertMessage:(NSString *)message parent:(UIViewController *)parent dismissAction:(void (^)(UIAlertAction *))dismiss confirmAction:(void (^)(UIAlertAction *))confirm {
    UIAlertController *alertView = [self baseAlertView:nil :message];
    if (confirm) [self addDismissAction1:alertView handler:confirm];
    [self addDismissAction1:alertView handler:dismiss];
    [parent presentViewController:alertView animated:NO completion:nil];
    
    return alertView;
}

+ (UIAlertController *)delayAlertMessage:(NSString *)message parent:(UIViewController *)parent {
    UIAlertController *alertView = [self baseAlertView:nil :message];
    [self addDismissAction1:alertView handler:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [parent presentViewController:alertView animated:NO completion:nil];
    });
    
    return alertView;
}

+ (UIAlertController *)notiAlertMessage:(NSString *)message parent:(UIViewController *)parent {
    return [self notiAlertMessage:message parent:parent dismissAction:nil];
}

+ (UIAlertController *)notiAlertMessage:(NSString *)message parent:(UIViewController *)parent dismissAction:(void (^)(void))completion {
    UIAlertController *alertView = [self baseAlertView:nil :message];
    [parent presentViewController:alertView animated:NO completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alertView dismissViewControllerAnimated:YES completion:completion];
    });
    
    return alertView;
}

+ (UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message emailText:(NSString *)placeholder parent:(UIViewController *)parent confirm:(void (^)(UIAlertAction *))confirm {
    UIAlertController *alertView = [self baseAlertView:title :message];
    
    [alertView addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholder;
    }];
    
    [self addDismissAction2:alertView handler:nil];
    [self addDismissAction1:alertView handler:confirm];
    
    [parent presentViewController:alertView animated:NO completion:nil];
    
    return alertView;
}

@end
