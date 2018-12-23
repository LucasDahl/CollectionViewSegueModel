//
//  ViewController.swift
//  CollectionViewSegueModel
//
//  Created by Lucas Dahl on 12/15/18.
//  Copyright © 2018 Lucas Dahl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, DescriptionViewControllerprotocol {
    
    // Properties - These should be a struct, not a class
    var arrayModels = [Model]()
    var muir = Model(name: "Muir", image: "1", id: "muir", description: "Mountain")
    var muirTwo = Model(name: "MuirTwo", image: "2", id: "muirTwo", description: "YASS QUEEN")
    var feet = Model(name: "Feet", image: "3", id: "feet", description: "Ew")
    var fruit = Model(name: "Fruit", image: "4", id: "fruit", description: "YUMMY!")
    var road = Model(name: "Road", image: "5", id: "road", description: "Take me home")
    var city = Model(name: "City", image: "6", id: "city", description: "To many people!")
    var crowd = Model(name: "Crowd", image: "7", id: "crowd", description: "WHY ARE THERE SO MANY PEOPLE")
    var falls = Model(name: "Falls", image: "8", id: "falls", description: "Seen one seen them all")
    var rocks = Model(name: "Rocks", image: "9", id: "rocks", description: "Stuck between")
    var market = Model(name: "Market", image: "10", id: "market", description: "This little piggy")
    
    // Properties
    var descriptionVC:DescriptionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the array
        arrayModels += ([muir, muirTwo, feet, fruit, road, city, crowd, falls, rocks, market])
        
        // Set up the popup
        descriptionVC = storyboard?.instantiateViewController(withIdentifier: "desc") as? DescriptionViewController
        descriptionVC?.delegate = self
        descriptionVC?.modalPresentationStyle = .overCurrentContext
        
    }

    
    // Number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayModels.count
    }
    
    // Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Make the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ModelCell
        
        // Round the coners
        cell.layer.cornerRadius = 20
        
        // Set the imageView
        let imageView = cell.viewWithTag(1) as! UIImageView
        
        // Set the image
        imageView.image = UIImage(named: arrayModels[indexPath.row].displayImage)
        
        // Set the label
        let textLabel = cell.viewWithTag(2) as! UILabel
        textLabel.text = arrayModels[indexPath.row].displayName
        
        // Gets the description from the model
        cell.desc = arrayModels[indexPath.row].modelDescirption
        
        // Make the button
        let button = UIButton(frame: CGRect(x:0, y:20, width:40,height:40))
        
        // Setup the button properties
        button.setImage(UIImage(named: "3dot"), for: UIControl.State.normal)
        
        // Add the method for the button
        button.addTarget(self, action: #selector(dataToPass), for: UIControl.Event.touchUpInside)
        
        // add the button to the cell
        cell.addSubview(button)
        
        // Return the cell
        return cell
        
    }
    
    
    // Selected cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get The name of the selected cell
        let name = arrayModels[indexPath.row].idVc
        
        // Get the ViewController
        let viewController = storyboard?.instantiateViewController(withIdentifier: name)
        
        // push the viewContoller
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    
    //===========================
    // MARK: - Pass data to popup
    //===========================
    
    // present the data to the description view controller
    func passData(title:String, description:String) {
        
        if descriptionVC != nil {
            
            present(descriptionVC!, animated: true) {
                
                self.descriptionVC?.setPopup(withTitle: title, withMessage: description)
                
            }
            
            
        }
    }
    
    // The method for the button to gather the data for the cell
    @objc func dataToPass(_ sender: UIButton) {
        
        let title = arrayModels[sender.tag].displayName
        let desc = arrayModels[sender.tag].modelDescirption
        
        passData(title: title, description: desc)
        
        print(sender.tag)
        
    }
    
    
    //===============
    // MARK: Protocol
    //===============
    
    func descriptionViewDismissed() {
        
      // Could add other buttons that lock certain cells for parental controls.
        
    }
    
   
} // End class

