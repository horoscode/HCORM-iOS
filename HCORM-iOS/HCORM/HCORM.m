//
//  HCORM.m
//  HCORM-iOS
//
//  Created by Adit on 05/09/14.
//  Copyright (c) 2014 Horoscode. All rights reserved.
//

#import "HCORM.h"

// Internal Import
#import "FRFMDBHelpers.h"

// External Import

// Static variables
static NSString *databasePath;

@implementation HCORM

+ (void)initWithDatabaseName:(NSString *)databaseName
{
    [HCORM initWithDatabaseName:databaseName andExtension:@"db"];
}

+ (void)initWithDatabaseName:(NSString *)databaseName
                andExtension:(NSString *)extension
{
    // Copy database to document folder and get the path
    databaseName = [FRFMDBHelpers copyDatabaseToDocumentFolderWithDatabaseName:databaseName
                                                                  andExtension:extension];
}

+ (NSString *)databasePath
{
    return databasePath;
}

@end
