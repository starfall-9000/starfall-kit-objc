//
//  BOTBaseTabbarController.m
//  StarfallKit
//
//  Created by An Binh on 1/2/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

#import "BOTBaseTabbarController.h"

#if defined(PrefixFileName)
#else
#define PrefixFileName @"BOT"
#endif

@implementation BOTBaseTabbarController

+ (NSString *)classNameFromKeyword:(NSString *)keyword {
    NSString *pascalCase = [BOTFormatter formatString:keyword toCase:StringFormatCasePascal];
    return [NSString stringWithFormat:@"%@%@ViewController", PrefixFileName, pascalCase];
}

+ (NSString *)titleFromKeyword:(NSString *)keyword {
    NSString *nameCase = [BOTFormatter formatString:keyword toCase:StringFormatCaseName];
    return nameCase;
}

+ (UIImage *)imageFromKeyword:(NSString *)keyword {
    NSString *kebabCase = [BOTFormatter formatString:keyword toCase:StringFormatCaseKebab];
    return [BOTImage resizeImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@-tabbar-icon", kebabCase]] withSize:CGSizeMake(BOTTabbarIconSize, BOTTabbarIconSize)];
}

+ (UIImage *)selectedImageFromKeyword:(NSString *)keyword {
    NSString *kebabCase = [BOTFormatter formatString:keyword toCase:StringFormatCaseKebab];
    return [BOTImage resizeImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@-select-tabbar-icon", kebabCase]] withSize:CGSizeMake(BOTTabbarIconSize, BOTTabbarIconSize)];;
}

+ (UITabBarController *)tabbarWithListKeyword:(NSArray *)keywords delegate:(nullable id  <UITabBarControllerDelegate>)delegate {
    NSMutableArray *listTabbar = [[NSMutableArray alloc] init];
    
    for (NSString *keyword in keywords) {
        NSString *class = [self classNameFromKeyword:keyword];
        UIViewController *itemVC = [[NSClassFromString(class) alloc] init];
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:itemVC];
        itemVC.title = [self titleFromKeyword:keyword];
        itemVC.tabBarItem.image = [self imageFromKeyword:keyword];
        itemVC.tabBarItem.selectedImage = [self selectedImageFromKeyword:keyword];
        [listTabbar addObject:navCtrl];
    }
    
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    tabbar.viewControllers = listTabbar;
    tabbar.delegate = delegate;
    
    return tabbar;
}

@end
