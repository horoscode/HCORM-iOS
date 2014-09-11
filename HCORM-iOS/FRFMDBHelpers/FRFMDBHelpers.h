//
//  FRFMDBHelpers.h
//
//  Created by Freeskys on 14/08/14.
//  Copyright (c) 2014 Freeskys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRFMDBHelpers : NSObject

/**
 * Copy database file to document folder
 */
+ (NSString *)copyDatabaseToDocumentFolderWithDatabaseName:(NSString *)databaseName
                                              andExtension:(NSString *)extension;

/**
 * Copy database file to document folder
 */
+ (NSString *)copyDatabaseToDocumentFolderWithDatabaseName:(NSString *)databaseName
                                              andExtension:(NSString *)extension
                                                 andFolder:(NSString *)folder;

@end
