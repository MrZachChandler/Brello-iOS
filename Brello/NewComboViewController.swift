//
//  NewComboViewController.swift
//  Brello
//
//  Created by Zach Chandler on 7/17/17.
//  Copyright © 2017 Mad Men Software. All rights reserved.
//

import UIKit
import Hero

class NewComboViewController: UIViewController {
    
    @IBOutlet weak var first: UIImageView!
    @IBOutlet weak var second: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var firstImage = #imageLiteral(resourceName: "brelloLogo")
    var secondImage = #imageLiteral(resourceName: "brelloLogo")
    var passTitle: String? = ""
    var desc = ""
    
    var pass: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        first.image = pass.icon
        second.image = pass.icon
        name.text = pass.name
        descriptionLabel.text = pass.shortDescription
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
