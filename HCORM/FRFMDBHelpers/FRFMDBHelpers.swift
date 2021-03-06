//
//  FRFMDBHelpers.swift
//  HCORM
//
//  Created by Adit on 9/16/14.
//  Copyright (c) 2014 Horoscode. All rights reserved.
//

import Foundation

/*************************************
*
* A simple class to copy your SQLite database to the Document folder, so we can access it.
*
*************************************/

class FRFMDBHelpers {
    
    /**
     * Copy database file to document folder
     * 
     * :param: databaseName String Your database name
     * :param: databaseExtension String Your database extension
     *
     * :return: Your database path
     */
    class func copyDatabaseToDocumentFolderWithDatabaseName(databaseName: String, databaseExtension: String)->String {
        return self.copyDatabaseToDocumentFolderWithDatabaseName(databaseName, databaseExtension: databaseExtension, databaseFolder: "")
    }
    
    /**
    * Copy database file to document folder
    *
    * :param: databaseName String Your database name
    * :param: databaseExtension String Your database extension
    * :param: databaseFolder String This is the folder (Group) where your SQLite database is located
    *
    * :return: Your database path
    */
    class func copyDatabaseToDocumentFolderWithDatabaseName(databaseName: String, databaseExtension: String, databaseFolder: String)->String {
        // Initialize variable
        var fileManager = NSFileManager.defaultManager()
        var error : NSError
        
        // Search for document directory
        var paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var documentDirectory: AnyObject = paths[0]
        var databasePath = documentDirectory.stringByAppendingString("/\(databaseName).\(databaseExtension)")
        
        // Check if file exist
        if fileManager.fileExistsAtPath(databasePath) == false {
            // File didn't exist. Then create them
            var resourcePath : String
            
            // Init resource path
            if databaseFolder == "" {
                resourcePath = NSBundle.mainBundle().pathForResource(databaseName, ofType: databaseExtension)!
            } else {
                resourcePath = NSBundle.mainBundle().pathForResource(databaseName, ofType: databaseExtension, inDirectory: databaseFolder)!
            }
            
            // Set database path
            //@TODO : Set database on HCORM
            
            // Copy database to document folder
            fileManager.copyItemAtPath(resourcePath, toPath: databasePath, error: nil)
        }
        
        return databasePath
    }
    
}