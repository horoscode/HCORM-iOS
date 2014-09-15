//
//  HCModel.m
//  HCORM-iOS
//
//  Created by Adit on 05/09/14.
//  Copyright (c) 2014 Horoscode. All rights reserved.
//

#import "HCModel.h"

// Internal Import
#import "HCORM.h"

// External Import

@implementation HCModel

- (id)init
{
    // Do some initialization
    
    return self;
}

- (BOOL)save
{
    // Init database
    FMDatabase *db = [self initializeDatabase];
    
    // Run Query
    BOOL result = [db executeUpdate:@"INSERT INTO ? VALUES 1", [self tableName]];
    
    // Close database
    [db close];
    
    // Return result
    return result;
}

- (FMResultSet *)all
{
    // Init database
    FMDatabase *db = [self initializeDatabase];
    
    // Run Query
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM ?", [self tableName]];
    
    // Return result set
    return rs;
}

- (FMResultSet *)first
{
    // Init database
    FMDatabase *db = [self initializeDatabase];
    
    // Run Query
    FMResultSet *rs = [db executeQuery:@"SELECT * FROM ? LIMIT 0,1", [self tableName]];
    
    // Return result set
    return rs;
}

- (FMDatabase *)initializeDatabase
{
    FMDatabase *db = [[FMDatabase alloc] initWithPath:[HCORM databasePath]];
    [db open];
    
    return db;
}

- (NSString *)tableName
{
    return @"TABLE";
}

@end
