//
//  SFTabbarController.m
//  StarfallKit
//
//  Created by An Binh on 1/2/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

#import "SFTabbarController.h"

@implementation SFTabbarController

+ (NSString *)titleFromKeyword:(NSString *)keyword {
    if ([keyword isEqualToString:@"home"]) return @"White";
    if ([keyword isEqualToString:@"rent"]) return @"Blue";
    if ([keyword isEqualToString:@"post"]) return @"Green";
    
    return @"Color";
}

@end
