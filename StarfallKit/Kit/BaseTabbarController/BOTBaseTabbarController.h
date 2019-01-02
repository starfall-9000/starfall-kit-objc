//
//  BOTBaseTabbarController.h
//  StarfallKit
//
//  Created by An Binh on 1/2/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BOTBaseTabbarController : NSObject

// image should be in kebab format key-word-tabbar-icon.png

// selected image should be in format key-word-select-tabbar-icon.png

+ (UITabBarController *)tabbarWithListKeyword:(NSArray *)keywords delegate:(nullable id <UITabBarControllerDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
