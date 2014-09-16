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
    * CRUD Class
    *
    *************************************/
    
    func save()->Bool {
        return true;
    }
    
    func all()->Array<AnyObject> {
        var array = [];
        
        return array;
    }
    
    func first()->Array<AnyObject> {
        var array = [];
        
        return array;
    }
    
    func findBy(criterias: Dictionary<String, String>)->Void {
        
    }
    
    func destroy()->Bool {
        return true;
    }
    
}