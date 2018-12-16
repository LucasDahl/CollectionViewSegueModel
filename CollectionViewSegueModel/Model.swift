//
//  Model.swift
//  CollectionViewSegueModel
//
//  Created by Lucas Dahl on 12/15/18.
//  Copyright © 2018 Lucas Dahl. All rights reserved.
//

import Foundation
//import UIKit

class Model {
    
    var displayName:String?
    var displayImage:String?
    var idVc:String?
    
    init(name:String, image:String, id:String) {
        
        displayName = name
        displayImage = image
        idVc = id
        
    }
    
}
