//
//  ModelCell.swift
//  CollectionViewSegueModel
//
//  Created by Lucas Dahl on 12/16/18.
//  Copyright © 2018 Lucas Dahl. All rights reserved.
//

import UIKit

class ModelCell: UICollectionViewCell {
    
    var desc:String?
    
    
    @IBAction func descriptionTapped(_ sender: UIButton) {
        
        // Print the description
        print(desc)
        
    }
    
    
}
