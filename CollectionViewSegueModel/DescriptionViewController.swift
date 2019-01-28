//
//  DescriptionViewController.swift
//  CollectionViewSegueModel
//
//  Created by Lucas Dahl on 12/17/18.
//  Copyright © 2018 Lucas Dahl. All rights reserved.
//

import UIKit

protocol DescriptionViewControllerprotocol {
    
    func passData(title:String, description:String)
    
}

class DescriptionViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dialogView: UIView!
    
    // Properties
    var delegate:DescriptionViewControllerprotocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Set the rounded corners for the dialogView
        dialogView.layer.cornerRadius = 20
        
        // Set the alpha
        dimView.alpha = 0
        titleLabel.alpha = 0
        descriptionText.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Sets the dim view alpha back to one, by animating it in.
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            
            self.dimView.alpha = 1
            
        }, completion: nil)
        
    }
    
    // Set the popup
    func setPopup(withTitle:String, withMessage:String) {
        
        titleLabel.text = withTitle
        descriptionText.text = withMessage
        
        // Fade in the labels
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            
            // Get the labels to appear
            self.titleLabel.alpha = 1
            self.descriptionText.alpha = 1
            
        }, completion: nil)
        
    }
    
    // Dismiss button
    @IBAction func dismissTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            
            self.dimView.alpha = 0
            self.titleLabel.alpha = 0
            self.descriptionText.alpha = 0
            
        }) { (completed) in
            
            // Only to dismiss after dim view has faded out.
            self.dismiss(animated: true, completion: {
                
                self.titleLabel.text = ""
                self.descriptionText.text = ""
                
            })
            
        }
        
    }
    
} // End class
