//
//  BOTFileManager.h
//  GlobalInnovation
//
//  Created by starfall on 10/4/17.
//  Copyright © 2017 GlobalInnovation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BOTFileManager : NSObject

#pragma mark file save local
+ (NSString *)pathFromFile:(NSString *)fileName;
+ (NSURL *)urlFromFile:(NSString *)fileName;
+ (NSData *)dataFromFile:(NSString *)fileName;
+ (BOOL)writeFileData:(NSData *)fileData fileName:(NSString *)fileName;
#pragma mark file save bundle
+ (NSString *)filePathWithFileName:(NSString *)fileName;
+ (NSString *)filePathWithResource:(NSString *)resource type:(NSString *)type;
+ (NSURL *)fileURLWithFileName:(NSString *)fileName;
+ (NSURL *)fileURLWithResource:(NSString *)resource type:(NSString *)type;
+ (NSData *)fileDataWithFileName:(NSString *)fileName;
+ (NSData *)fileDataWithResource:(NSString *)resource type:(NSString *)type;
#pragma mark file from url
+ (NSURL *)urlFromString:(NSString *)string;
+ (NSData *)dataFromString:(NSString *)string;

@end
