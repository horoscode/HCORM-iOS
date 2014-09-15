//
//  FRFMDBHelpers.m
//
//  Created by Freeskys on 14/08/14.
//  Copyright (c) 2014 Freeskys. All rights reserved.
//

#import "FRFMDBHelpers.h"

// Internal Import
#import "HCORM.h"

// External Import

@implementation FRFMDBHelpers

+ (NSString *)copyDatabaseToDocumentFolderWithDatabaseName:(NSString *)databaseName andExtension:(NSString *)extension
{
    return [self copyDatabaseToDocumentFolderWithDatabaseName:databaseName andExtension:extension andFolder:nil];
}

+ (NSString *)copyDatabaseToDocumentFolderWithDatabaseName:(NSString *)databaseName andExtension:(NSString *)extension andFolder:(NSString *)folder
{
    // Init variable
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    // Get document directory path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask,
                                                         YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingString:[NSString stringWithFormat:@"/%@.%@", databaseName, extension]];
    
    // Check if file exist
    if ([fileManager fileExistsAtPath:dbPath] == NO) {
        NSString *resourcePath;
        
        // Init resource path
        if (folder == nil) {
            resourcePath = [[NSBundle mainBundle] pathForResource:databaseName
                                                           ofType:extension];
        } else {
            resourcePath = [[NSBundle mainBundle] pathForResource:databaseName
                                                           ofType:extension
                                                      inDirectory:folder];
        }
        
        NSLog(@"%@.%@ - Folder: %@", databaseName, extension, folder);
        NSLog(@"Resource Path: %@", resourcePath);
        NSLog(@"DB Path: %@", dbPath);
        
        // Set database path
        [HCORM setDatabasePath:dbPath];
        
        // Copy database to document folder
        [fileManager copyItemAtPath:resourcePath
                             toPath:dbPath
                              error:&error];
    }
    
    return dbPath;
}

@end
