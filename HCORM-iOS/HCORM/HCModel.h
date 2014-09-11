//
//  HCModel.h
//  HCORM-iOS
//
//  Created by Adit on 05/09/14.
//  Copyright (c) 2014 Horoscode. All rights reserved.
//

#import <Foundation/Foundation.h>

// Internal Import
#import "HCORM.h"

// External Import

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
- (HCModel *)all;

/**
 * Get the first data
 */
- (HCModel *)first;

/**
 * Get data from database based on criterias.
 */
- (HCModel *)findBy:(NSDictionary *)criterias;

/**
 * Delete data from database
 */
- (BOOL)destroy;

//----- End CRUD -----

@end
