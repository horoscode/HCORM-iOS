//
//  HCORM.h
//  HCORM-iOS
//
//  Created by Adit on 05/09/14.
//  Copyright (c) 2014 Horoscode. All rights reserved.
//

#import <Foundation/Foundation.h>

// Internal Import

// External Import
#import <FMDB/FMDB.h>

@interface HCORM : NSObject

/**
 * Init database.
 *
 * @param databaseName
 */
+ (void)initWithDatabaseName:(NSString *)databaseName;

/**
 * Init database.
 *
 * @param databaseName
 * @param extension
 */
+ (void)initWithDatabaseName:(NSString *)databaseName andExtension:(NSString *)extension;

/**
 * Get database path
 */
+ (NSString *)databasePath;

@end
