//
//  BOTValidation.m
//  GlobalInnovation
//
//  Created by starfall on 10/3/17.
//  Copyright © 2017 GlobalInnovation. All rights reserved.
//

#import "BOTValidation.h"

@implementation BOTValidation

+ (BOOL)validEmail:(NSString *)email parent:(UIViewController *)parent {
    BOTValidation *valid = [[BOTValidation alloc] init];
    if ([valid validateEmail:email]) {
        return YES;
    } else {
        [BOTAlert alertMessage:@"Invalid Email" parent:parent];
        return NO;
    }
}

- (BOOL)validateEmail:(NSString *)checkString{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

+ (BOOL)validPassword:(NSString *)password parent:(UIViewController *)parent {
    if ([password length] < 6) {
        [BOTAlert alertMessage:@"Password must be at least 6 characters" parent:parent];
        return NO;
    }

    return YES;
}

+ (BOOL)validConfirmPassword:(NSString *)confirm password:(NSString *)password parent:(UIViewController *)parent {
    if (![password isEqualToString:confirm]) {
        [BOTAlert alertMessage:@"Confirm password must be same as password" parent:parent];
        return NO;
    }
    
    return YES;
}

+ (BOOL)validNone:(NSString *)text parent:(UIViewController *)parent {
    if ([text length] == 0) {
        [BOTAlert alertMessage:@"Fill the blank field" parent:parent];
        return NO;
    }
    
    return YES;
}

@end
