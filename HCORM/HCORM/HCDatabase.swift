//
//  HCDatabase.swift
//  HCORM
//
//  Created by Adit on 9/20/14.
//  Copyright (c) 2014 Horoscode. All rights reserved.
//

import Foundation

struct HCDatabase {
    
    static var database: FMDatabase = FMDatabase(path: HCSettings.databasePath())
    
    /*************************************
    *
    * Database Class
    *
    *************************************/
    
    /**
     * Open connection to database
     */
    static func openDatabase() {
        if (!database.open()) {
            database.open()
        }
    }
    
    /**
    * Close connection to database
    */
    static func closeDatabase() {
        if (database.open()) {
            database.close()
        }
    }
    
    static func initDatabase()->FMDatabase {
        HCDatabase.openDatabase()
        
        return database
    }
    
}