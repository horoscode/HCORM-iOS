//
//  HCModel.swift
//  HCORM-Demo
//
//  Created by Adit on 9/17/14.
//  Copyright (c) 2014 Horoscode. All rights reserved.
//

import Foundation

class HCModel : NSObject {
    
    /*************************************
    *
    * Overidden Variables
    *
    *************************************/
    
    var primaryKey: String = "";
    var tableName: String = "";
    
    /*************************************
    *
    * CRUD Class
    *
    *************************************/
    
    func save()->Bool {
        var reflection = reflect(self)
        
        for var i=1; i<reflection.count; i++ {
            println("Reflection: \(reflection[i].1.summary)")
        }
        
        return true
    }
    
    func all<T>()->Array<AnyObject> {
        var database: FMDatabase = HCDatabase.initDatabase()
        var resultSet: FMResultSet = database.executeQuery("SELECT * FROM \(tableName)", withArgumentsInArray: nil)
        
        var _objects: Array<T> = []
        while (resultSet.next()) {
            var _object = T.self;
            
        }
        
        return parseToArrayWithResultSet(resultSet)
    }
    
    func first()->Array<AnyObject> {
        var array = []
        
        return array
    }
    
    func findBy(criterias: Dictionary<String, String>)->Void {
        
    }
    
    func destroy()->Bool {
        // Initialize FMDB
        var db: FMDatabase = FMDatabase(path: HCSettings.databasePath())
        
        // Opening database
        db.open()
        
        // Execute query
        var result = db.executeUpdate("DELETE FROM ? WHERE ? = ?", withArgumentsInArray: [tableName, primaryKey, primaryKeyValue()])
        
        // Closing database
        db.close()
        
        // Returning result
        return result
    }
    
    /*************************************
    *
    * Model Helpers
    *
    *************************************/
    
    /**
     * Get value of primary key
     * 
     * :return: String Value of primary key
     */
    func primaryKeyValue()->String {
        var reflection = reflect(self)
        var primaryKeyValue = ""
        
        for var i=1; i<reflection.count; i++ {
            if reflection[i].0 == primaryKey {
                primaryKeyValue = reflection[i].1.summary
                break
            }
        }
        
        return primaryKeyValue
    }
    
    func parseToArrayWithResultSet(resultSet: FMResultSet)->Array<AnyObject> {
        var result: Array = []
        var reflection = reflect(self)
        
        while(resultSet.next()) {
            var _model: AnyClass = self.dynamicType
            
            // Insert data into model
            for var i=1; i<reflection.count; i++ {
                var currentField = reflection[i].0
                var value = resultSet.stringForColumn(currentField)
                
                // Set value on the variable
                self.setValue(value, forKey: currentField)
            }
            
            result.append(_model)
        }
        
        return result
    }
    
}