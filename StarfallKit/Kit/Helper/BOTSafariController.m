
//
//  GMOSafariController.m
//  GMOSDK
//
//  Created by Mac on 4/7/17.
//  Copyright © 2017 LTV. All rights reserved.
//

#import "BOTSafariController.h"
#import <SafariServices/SafariServices.h>

@interface BOTSafariController ()

@end

@implementation BOTSafariController

+ (void)showSafariWithURL:(NSString *)url {
    return [self showSafariFromController:[BOTFormatter topMostViewController] withURL:url];
}

+ (void)showSafariFromController:(UIViewController *)viewCtrl withURL:(NSString *)url {
//    if (@available(iOS 9.0, *)) {
        if ([SFSafariViewController class]) {
            SFSafariViewController *sfViewController = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:url]];
            [viewCtrl presentViewController:sfViewController animated:YES completion:^{
                
            }];
        
    } else {
        // Fallback on earlier versions
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }
}

@end
