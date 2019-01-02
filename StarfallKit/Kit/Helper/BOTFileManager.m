//
//  BOTFileManager.m
//  GlobalInnovation
//
//  Created by starfall on 10/4/17.
//  Copyright © 2017 GlobalInnovation. All rights reserved.
//

#import "BOTFileManager.h"

@implementation BOTFileManager

#pragma mark file save local
+ (NSString *)pathFromFile:(NSString *)fileName {
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [filePath stringByAppendingPathComponent:fileName];
}

+ (NSURL *)urlFromFile:(NSString *)fileName {
    return [NSURL URLWithString:[self pathFromFile:fileName]];
}

+ (NSData *)dataFromFile:(NSString *)fileName {
//    return [NSData dataWithContentsOfURL:[self urlFromFile:fileName]];
    return [[NSFileManager defaultManager] contentsAtPath:[self pathFromFile:fileName]];
}

+ (BOOL)createFolder:(NSString *)path {
    NSError *error;
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:&error]; //Create folder
    [BOTLogger logError:error fromSender:self];
    
    return !error;
}

+ (BOOL)writeFileData:(NSData *)fileData fileName:(NSString *)fileName {
    // Store the Data locally as PDF File
//    NSString *resourceDocPath = [[NSString alloc] initWithString:[[[NSBundle mainBundle] resourcePath] stringByDeletingLastPathComponent]];
    NSString *resourceDocPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString *dataPath = [resourceDocPath stringByAppendingString:@"/Download"];
//    [self createFolder:dataPath];
    
    NSString *filePath = [resourceDocPath stringByAppendingPathComponent:fileName];
    NSError *error;
    BOOL success = [fileData writeToFile:filePath options:NSDataWritingAtomic error:&error];
    if (error) [BOTLogger logError:error fromSender:self];
    
    return success;
}

#pragma mark file save bundle
+ (NSString *)filePathWithFileName:(NSString *)fileName {
    NSMutableArray *seperate = [[NSMutableArray alloc] initWithArray:[fileName componentsSeparatedByString:@"."]];
    NSString *type = [seperate lastObject];
    [seperate removeLastObject];
    NSString *resource = [seperate componentsJoinedByString:@"."];
    
    return [self filePathWithResource:resource type:type];
}

+ (NSString *)filePathWithResource:(NSString *)resource type:(NSString *)type {
    return [[NSBundle mainBundle] pathForResource:resource ofType:type];
}

+ (NSURL *)fileURLWithFileName:(NSString *)fileName {
    return [NSURL fileURLWithPath:[self filePathWithFileName:fileName]];
}

+ (NSURL *)fileURLWithResource:(NSString *)resource type:(NSString *)type {
    return [NSURL fileURLWithPath:[self filePathWithResource:resource type:type]];
}

+ (NSData *)fileDataWithFileName:(NSString *)fileName {
    return [[NSFileManager defaultManager] contentsAtPath:[self filePathWithFileName:fileName]];
}

+ (NSData *)fileDataWithResource:(NSString *)resource type:(NSString *)type {
    return [[NSFileManager defaultManager] contentsAtPath:[self filePathWithResource:resource type:type]];
}

#pragma mark file from url
+ (NSURL *)urlFromString:(NSString *)string {
    return [NSURL URLWithString:string];
}

+ (NSData *)dataFromString:(NSString *)string {
    return [NSData dataWithContentsOfURL:[self urlFromString:string]];
}

@end
