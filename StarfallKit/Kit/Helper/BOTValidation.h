//
//  BOTValidation.h
//  GlobalInnovation
//
//  Created by starfall on 10/3/17.
//  Copyright © 2017 GlobalInnovation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BOTValidation : NSObject

+ (BOOL)validEmail:(NSString *)email parent:(UIViewController *)parent;
+ (BOOL)validPassword:(NSString *)password parent:(UIViewController *)parent;
+ (BOOL)validConfirmPassword:(NSString *)confirm password:(NSString *)password parent:(UIViewController *)parent;
+ (BOOL)validNone:(NSString *)text parent:(UIViewController *)parent;

@end
