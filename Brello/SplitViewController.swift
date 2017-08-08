//
//  SplitViewController.swift
//  Brello
//
//  Created by Zach Chandler on 7/17/17.
//  Copyright © 2017 Mad Men Software. All rights reserved.
//

import UIKit
import Hero

class SplitViewController: UIViewController {
    
    @IBOutlet weak var first: UIImageView!
    @IBOutlet weak var second: UIImageView!
    @IBOutlet weak var imageView: UIImageView!

    var firstImage = #imageLiteral(resourceName: "brelloLogo")
    var secondImage = #imageLiteral(resourceName: "brelloLogo")
    var myPass : City!
    var pass: City!
    var pass2: City!
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        first.image = pass.icon
        second.image = pass2.icon
        imageView.image = myPass.icon
        imageView.layer.cornerRadius = imageView.frame.size.height/2
        imageView.layer.masksToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    @IBAction func divide(_ sender: Any){
        
        switch myPass.type {
        case 2:
            
            City.passes.remove(at: index)
            City.passes.append(contentsOf: City.redPasses)
            
            
        case 3:
            City.passes.remove(at: index)
            City.passes.append(contentsOf: City.redBlue)
            
        case 4:
           City.passes.remove(at: index)
            City.passes.append(contentsOf: City.bluePasses)
            
        case 5:
            City.passes.remove(at: index)
            City.passes.append(contentsOf: City.greenBlue)
            
        default:
            City.passes.remove(at: index)
            City.passes.append(pass)
            City.passes.append(pass2)
        }
    }
}
