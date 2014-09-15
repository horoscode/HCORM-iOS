//
//  HCModel.h
//  HCORM-iOS
//
//  Created by Adit on 05/09/14.
//  Copyright (c) 2014 Horoscode. All rights reserved.
//

#import <Foundation/Foundation.h>

//---- Internal Import -----
#import "HCORM.h"

//---- External Import -----
// Load FMDB
#import <FMDB/FMDB.h>

@interface HCModel : NSObject

- (id)init;

//----- CRUD -----

/**
 * Save object to database
 */
- (BOOL)save;

/**
 * Get all data from database
 */
- (FMResultSet *)all;

/**
 * Get the first data
 */
- (FMResultSet *)first;

/**
 * Get data from database based on criterias.
 */
- (FMResultSet *)findBy:(NSDictionary *)criterias;

/**
 * Delete data from database
 */
- (BOOL)destroy;

//----- End CRUD -----

//----- Tools -----
- (FMDatabase *)initializeDatabase;
//----- End Tools -----

//----- Overidden Method -----
- (NSString *)tableName;
//----- End Overidden Method -----

@end
