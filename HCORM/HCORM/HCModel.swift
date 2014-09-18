//
//  HCModel.swift
//  HCORM-Demo
//
//  Created by Adit on 9/17/14.
//  Copyright (c) 2014 Horoscode. All rights reserved.
//

import Foundation

class HCModel {
    
    /*************************************
    *
    * Overidden Variables
    *
    *************************************/
    
    var primaryKey = "";
    var tableName = "";
    
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
    
    func all()->Array<AnyObject> {
        var array = []
        
        return array
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
        var result = db.executeUpdate("DELETE FROM ? WHERE ? = ?", withArgumentsInArray: [tableName, primaryKey, getPrimaryKeyValue()])
        
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
    func getPrimaryKeyValue()->String {
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
    
}