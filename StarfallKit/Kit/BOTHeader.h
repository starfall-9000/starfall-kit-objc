//
//  BOTHeader.h
//  BaseObjectTest
//
//  Created by Mac on 2/14/17.
//  Copyright © 2017 Mac. All rights reserved.
//

#ifndef BOTHeader_h
#define BOTHeader_h

#import "BOTLogger.h"
#import "BOTDefineMessage.h"
#import "BOTImage.h"
#import "BOTAlert.h"
#import "BOTValidation.h"
#import "BOTFileManager.h"
#import "BOTFormatter.h"
//#import "BOTBaseUserInfo.h"

typedef void (^BoolCompletionBlock)(BOOL complete);
typedef void (^DataResponseBlock)(id object, NSError *error);

//static NSInteger const BOTAdvertCountSelect = 5;
//static NSString* const GADInterstitialID = @"ca-app-pub-7976074226835443/9462068819";
//static NSString* const GADBannerID = @"ca-app-pub-7976074226835443/9181684011";

//define float
static CGFloat const BOTStatusBar = 20;
static CGFloat const BOTBarHeight = 44;
static CGFloat const BOTTopHeight = BOTStatusBar + BOTBarHeight;

#endif /* BOTHeader_h */
