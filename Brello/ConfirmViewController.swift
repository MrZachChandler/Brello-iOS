//
//  ConfirmViewController.swift
//  Brello
//
//  Created by Zach Chandler on 7/24/17.
//  Copyright © 2017 Mad Men Software. All rights reserved.
//

import UIKit
import Hero

class ConfirmViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var brelloLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    
    var name = "Single Brello"
    var desc = "Base Brello"
    var price = "$6.00"
    var image = #imageLiteral(resourceName: "brelloLogo")
    var color = Colours.brelloPink()
    var city: City!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = desc
        brelloLabel.text = name
        priceLabel.text = price
        imageView.image = image
        closeButton.backgroundColor = color
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func confirm(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure?", message: "Confirm purchase for \(price)?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: { action in
            City.passes.append(self.city)
            DispatchQueue.main.async {
                
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

