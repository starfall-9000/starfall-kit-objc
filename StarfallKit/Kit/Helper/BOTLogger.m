//
//  BOTLogger.m
//  BaseObjectTest
//
//  Created by Mac on 2/8/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "BOTLogger.h"

@implementation BOTLogger

+ (void)logClassTracking:(id)sender {
    NSLog(@"Logging %@: ", [sender class]);
}

+ (void)logItem:(id)item fromSender:(id)sender {
    [self logClassTracking:sender];
    NSLog(@"%@", item);
}

+ (void)logViewFrame:(UIView *)view fromSender:(id)sender {
    [self logClassTracking:sender];
    NSLog(@"x = %f y = %f wid = %f hei = %f", view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
}

+ (void)logMessage:(NSString *)message fromSender:(id)sender {
    [self logClassTracking:sender];
    NSLog(@"%@", message);
}

+ (void)logError:(NSError *)error fromSender:(id)sender {
    [self logClassTracking:sender];
    NSLog(@"%@", error.localizedDescription);
}

+ (void)logAllViewControllerFromSender:(id)sender {
    UIWindow *window = [BOTFormatter findWindow];
    UIViewController *root = window.rootViewController;
    
    [self logClassTracking:sender];
    [self logViewController:root level:0];
}

+ (void)logViewController:(UIViewController *)root level:(NSInteger)level {
  NSLog(@"level %ld: %@", (long)level, root);
    
    if ([root isKindOfClass:[UINavigationController class]]) {
        for (UIViewController *viewController in [(UINavigationController *)root viewControllers]) {
            [self logViewController:viewController level:level + 1];
        }
        return;
    }
    
    if (root.presentedViewController) {
        [self logViewController:root.presentedViewController level:level + 1];
        return;
    }
}

+ (void)logAllView:(UIView *)view FromSender:(id)sender {
    [self logClassTracking:sender];
    [self logView:view level:0];
}

+ (void)logView:(UIView *)root level:(NSInteger)level {
  NSLog(@"level %ld: %@", (long)level, root);
    for (UIView *view in root.subviews) {
        [self logView:view level:level + 1];
    }
}

+ (void)logAllFont:(NSString *)familyName fromSender:(id)sender {
    [self logClassTracking:sender];
    
    if (!familyName) NSLog(@"%@", [UIFont familyNames]);
    else NSLog(@"%@", [UIFont fontNamesForFamilyName:familyName]);
}

@end
