//
//  HCORM.swift
//  HCORM-Demo
//
//  Created by Adit on 9/17/14.
//  Copyright (c) 2014 Horoscode. All rights reserved.
//

import Foundation

class HCORM {
    
    /*************************************
    *
    * Initialize HCORM
    *
    *************************************/
    
    /**
    * Init HCORM
    *
    * @param databaseName String The name of the SQLite database. If you have "mydb.db" then insert "mydb"
    */
    class func initWithDatabaseName(databaseName: String)->Void {
        HCORM.initWithDatabaseName(databaseName, databaseExtension: "db")
    }
    
    /**
    * Init HCORM
    *
    * @param databaseName String The name of the SQLite database. If you have "mydb.db" then insert "mydb"
    * @param databaseExtension String Extension from your SQLite database. Usually "db" or "sqlite"
    */
    class func initWithDatabaseName(databaseName: String, databaseExtension: String)->Void {
        HCSettings.setDatabasePath(FRFMDBHelpers.copyDatabaseToDocumentFolderWithDatabaseName(databaseName, databaseExtention: databaseExtension));
    }
    
}