//
//  GMOSafariController.h
//  GMOSDK
//
//  Created by Mac on 4/7/17.
//  Copyright © 2017 LTV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BOTSafariController : NSObject

+ (void)showSafariWithURL:(NSString *)url;
+ (void)showSafariFromController:(UIViewController *)viewCtrl withURL:(NSString *)url;

@end
