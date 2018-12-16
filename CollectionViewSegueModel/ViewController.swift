//
//  ViewController.swift
//  CollectionViewSegueModel
//
//  Created by Lucas Dahl on 12/15/18.
//  Copyright © 2018 Lucas Dahl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Properties
    var arrayModels = [Model]()
    var muir = Model(name: "muir", image: "1", id: "muir")
    var muirTwo = Model(name: "muirTwo", image: "2", id: "muirTwo")
    var feet = Model(name: "Feet", image: "3", id: "feet")
    var fruit = Model(name: "Fruit", image: "4", id: "fruit")
    var road = Model(name: "Road", image: "5", id: "road")
    var city = Model(name: "City", image: "6", id: "city")
    var crowd = Model(name: "Crowd", image: "7", id: "crowd")
    var falls = Model(name: "Falls", image: "8", id: "falls")
    var rocks = Model(name: "Rocks", image: "9", id: "rocks")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        arrayModels.append(muir)
//        arrayModels.append(muirTwo)
        arrayModels += ([muir, muirTwo, feet, fruit, road, city, crowd, falls, rocks])
        
    }

    
    // Number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayModels.count
    }
    
    // Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Make the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! UICollectionViewCell
        
        // Set the imageView
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: arrayModels[indexPath.row].displayImage!)
        
        // Set the label
        let textLabel = cell.viewWithTag(2) as! UILabel
        textLabel.text = arrayModels[indexPath.row].displayName!
        
        // TODO: - Add a popup vc for a description
        
        // Return the cell
        return cell
        
    }
    
    // Selected cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get The name of the selected cell
        let name = arrayModels[indexPath.row].idVc
        
        // Get the ViewController
        let viewController = storyboard?.instantiateViewController(withIdentifier: name!)
        
        // push the viewContoller
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    
//            //Set up the grid
//            let numberOfColumns: CGFloat = 2 // Chnage this fto change the number of columns displayed
//            let width = collectionView.frame.size.width
//            let xInsets: CGFloat = 10
//            let cellSpacing: CGFloat = 5
//            let image = UIImage(named: arrayModels[indexPath.row].displayImage!)
//            let height = image!.size.height
//    
//            return CGSize(width: (width / numberOfColumns) - (xInsets + cellSpacing), height: height)
//        }

}

