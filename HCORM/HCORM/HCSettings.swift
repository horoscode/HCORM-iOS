//
//  HCSettings.swift
//  HCORM-Demo
//
//  Created by Adit on 9/17/14.
//  Copyright (c) 2014 Horoscode. All rights reserved.
//

import Foundation

struct HCSettings {
    
    // Settings constant
    static let DATABASE_PATH = "databasePath"
    
    // Settings variable
    static var settings: Dictionary<String, String> = [
        HCSettings.DATABASE_PATH : ""
    ];
    
    /*************************************
     *
     * This is settings setter and getter
     *
     *************************************/
    
    /**
     * Set database path
     * 
     * @param databasePath String The database path.
     */
    static func setDatabasePath(databasePath: String)->Void {
        HCSettings.settings[HCSettings.DATABASE_PATH] = databasePath
    }
    
    /**
     * Get database path
     *
     * @return The path of the database.
     */
    static func databasePath()->String {
        return HCSettings.settings[HCSettings.DATABASE_PATH]!
    }
    
}