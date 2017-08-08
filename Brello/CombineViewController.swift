//
//  CombineViewController.swift
//  Brello
//
//  Created by Zach Chandler on 7/17/17.
//  Copyright © 2017 Mad Men Software. All rights reserved.
//

import UIKit
import Hero

class CombineViewController: UIViewController {
    
    @IBOutlet weak var first: UIImageView!
    @IBOutlet weak var second: UIImageView!
    @IBOutlet weak var firstD: UILabel!
    @IBOutlet weak var secondD: UILabel!

    var firstImage = #imageLiteral(resourceName: "brelloLogo")
    var secondImage = #imageLiteral(resourceName: "brelloLogo")

    var pass: City!
    var pass2: City!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        first.image = firstImage
        second.image = secondImage
        firstD.text = pass.shortDescription
        secondD.text = pass2.shortDescription
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if let vc = segue.destination as? NewComboViewController {
                vc.pass = combine()
            }
        
    }
    func combine() -> City {
        let type = pass2.type + pass.type
        var one = false
        var two = false
        var i = 0
        for pas in City.passes{
            if pas.type == pass.type && one == false{
                City.passes.remove(at: i)
                one = true
                i -= 1
            }
            if pass2.type == pas.type && two == false{
                City.passes.remove(at: i)
                two = false
                i -= 1
            }
            i += 1
        }
        switch type {
        case 2:
            pass.icon = #imageLiteral(resourceName: "BlueLogo")
            pass.image = #imageLiteral(resourceName: "BlueCell")
            pass.name = "Blue Brello"
            pass.shortDescription = "Double Coverage"
            pass.description = "Double Coverage"
            pass.type = type
        case 3:
            pass.icon = #imageLiteral(resourceName: "GreenLogo")
            pass.image = #imageLiteral(resourceName: "GreenCell")
            pass.name = "Green Brello"
            pass.shortDescription = "Triple Coverage"
            pass.description = "Triple Coverage"
            pass.type = type
        case 4:
            pass.icon = #imageLiteral(resourceName: "GoldLogo")
            pass.image = #imageLiteral(resourceName: "goldCell")
            pass.name = "Gold Brello"
            pass.shortDescription = "Quadrouple Coverage"
            pass.description = "Quadrouple Coverage"
            pass.type = type
        case 5:
            pass.icon = #imageLiteral(resourceName: "OrangeLogo")
            pass.image = #imageLiteral(resourceName: "OrangeCell")
            pass.name = "Orange Brello"
            pass.shortDescription = "Quintuple Coverage"
            pass.description = "Quintuple Coverage"
            pass.type = type
            
        default:
            pass.icon = #imageLiteral(resourceName: "PinkLogo")
            pass.image = #imageLiteral(resourceName: "PinkCell")
            pass.name = "Pink Brello"
            pass.shortDescription = "Group Brello \(type)"
            pass.description = "Group Brello \(type)"
            pass.type = type
        }
        City.passes.append(pass)
        return pass
    }
    
}
