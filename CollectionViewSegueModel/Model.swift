//
//  Model.swift
//  CollectionViewSegueModel
//
//  Created by Lucas Dahl on 12/15/18.
//  Copyright © 2018 Lucas Dahl. All rights reserved.
//

import Foundation

struct Model {
    
    // Properties
    var displayName:String = ""
    var displayImage:String = ""
    var idVc:String = ""
    var modelDescirption:String = ""
    
    // Initializer for the class
    init(name:String, image:String, id:String, description:String) {
        
        displayName = name
        displayImage = image
        idVc = id
        modelDescirption = description
        
    }
    
}
