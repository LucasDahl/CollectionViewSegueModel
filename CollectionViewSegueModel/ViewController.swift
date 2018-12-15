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
    var arrayOfImages = [UIImage]()
    var arrayOfIDs = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfImages = [#imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "2")]
        arrayOfIDs = ["A", "B"]
        
    }

    
    // Number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfImages.count
    }
    
    // Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Make the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! UICollectionViewCell
        
        // Set the imageView
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = arrayOfImages[indexPath.row]
        
        // Return the cell
        return cell
        
    }
    
    // Selected cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get The name of the selected cell
        let name = arrayOfIDs[indexPath.row]
        
        // Get the ViewController
        let viewController = storyboard?.instantiateViewController(withIdentifier: name)
        
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
//            let image = arrayOfImages[indexPath.item]
//            let height = image.size.height
//    
//            return CGSize(width: (width / numberOfColumns) - (xInsets + cellSpacing), height: height)
//        }

}

