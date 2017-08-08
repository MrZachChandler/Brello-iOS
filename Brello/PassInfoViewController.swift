//
//  PassInfoViewController.swift
//  Brello
//
//  Created by Zach Chandler on 7/16/17.
//  Copyright © 2017 Mad Men Software. All rights reserved.
//

import UIKit
import Hero
import PopupDialog

struct combo {
    var index: Int
    var pass: City
}

class PassInfoViewController: UIViewController {
    var combos: [City] = []
    var passType = 1
    var index: Int!
    var myPass : City!
    
    var pinkPasses: [City] = []
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet var combineButtons: [UIButton]!
    @IBOutlet weak var refundButton : UIButton!
    @IBOutlet weak var combineButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hero_dismissViewController)))
        combineSetUp()
        imageView.image = myPass.icon
        imageView.layer.cornerRadius = imageView.frame.size.height/2
        imageView.layer.masksToBounds = true
    }
    @IBAction func refund(_ sender: Any){
        City.passes.remove(at: index)
        let alert = UIAlertController(title: "Success!", message: "Your refund will appear in 48 hours.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { action in
            self.hideButtons()
            self.hero_dismissViewController()
            self.hero_unwindToRootViewController()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func combineBrellos(_ sender: UIButton) {
        
        sender.heroID = "withBrello"
        sender.heroModifiers = [HeroModifier.arc()]
        performSegue(withIdentifier: "BrelloCombo", sender: sender.tag)

    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let senderTag = sender as? Int {
            if segue.identifier == "dividePasses" {
                if let vc = segue.destination as? SplitViewController {
                    vc.myPass = myPass
                    vc.index = index
                    switch myPass.type {
                    case 2:
                        vc.pass = City.redPasses[0]
                        vc.pass2 = City.redPasses[1]
                    case 3:
                        vc.pass = City.redBlue[0]
                        vc.pass2 = City.redBlue[1]
                    case 4:
                        vc.pass = City.bluePasses[0]
                        vc.pass2 = City.bluePasses[1]
                    case 5:
                        vc.pass = City.greenBlue[0]
                        vc.pass = City.greenBlue[1]
                    default:
                        var pass = 0
                        let type = passType / 2
                        let mod = passType % 2
                        if mod == 0 {
                            pass = type
                        } else {
                            pass = mod
                        }
                        let passOne = makePass(type: pass)
                        let passTwo = makePass(type: type)
                        pinkPasses.append(passOne)
                        pinkPasses.append(passTwo)
                        vc.pass = pinkPasses[0]
                        vc.pass = pinkPasses[1]
                    }
                }
                
            } else{
                if let vc = segue.destination as? CombineViewController {
                    vc.firstImage = myPass.icon
                    vc.pass = myPass
                    vc.pass2 = makePass(type: senderTag)
                    switch senderTag {
                    case 1:
                        vc.secondImage = #imageLiteral(resourceName: "brelloLogo")
                    case 2:
                        vc.secondImage = #imageLiteral(resourceName: "BlueLogo")
                    case 3:
                        vc.secondImage = #imageLiteral(resourceName: "GreenLogo")
                    case 4:
                        vc.secondImage = #imageLiteral(resourceName: "GoldLogo")
                    case 5:
                        vc.secondImage = #imageLiteral(resourceName: "OrangeLogo")
                    default:
                        vc.secondImage = #imageLiteral(resourceName: "PinkLogo")
                    }
                    
                }

            }
            
        }
    }

    @IBAction func divide(_ sender: Any){
        var message = ""

        var myTitle = ""

        switch passType {
        case 1:
            myTitle = "Whooops!"
            message = "You cannot divide a single pass."
            let alert = UIAlertController(title: myTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        default:
            var pass = 0
            let type = passType / 2
            let mod = passType % 2
            if mod == 0 {
                pass = type
            } else {
                pass = mod
            }
            let passOne = makePass(type: pass)
            let passTwo = makePass(type: type)
            pinkPasses.append(passOne)
            pinkPasses.append(passTwo)
            
        
        }
        performSegue(withIdentifier: "dividePasses", sender: passType)

    }
    func makeMessage(typeOne: Int, typeTwo: Int) -> String {
        var message = ""
        if typeOne == typeTwo{
            switch typeOne {
            case 3:
                message = "Your Pink Brello is now two Green Brellos"
            case 4:
                message = "Your Pink Brello is now two Gold Brellos"
            case 5:
                message = "Your Pink Brello is now two Orange Brellos"
            default:
                message = "Your Pink Brello is now two Pink Brellos \(typeOne)"
            }
        } else {
        
            switch typeOne {
            case 3:
                message = "Your Pink Brello is now one Green Brello"
            case 4:
                message = "Your Pink Brello is now one Gold Brello"
            case 5:
                message = "Your Pink Brello is now one Orange Brello"
            default:
                message = "Your Pink Brello is one Pink Brello \(typeOne)"

            }
            switch typeTwo {
            case 3:
                message += "and one Green Brello"
            case 4:
                message += "and one Gold Brello"
            case 5:
                message += "and one Orange Brello"
            default:
                message += "and one Pink Brello \(typeTwo)"
                
            }
        }
            
        
        return message
    }
    func makePass(type: Int) -> City {
        var pass = City(name: "Blue Brello",
                        image: #imageLiteral(resourceName: "BlueCell"),
                        shortDescription: "Double Coverage",
                        description: "Double Coverage",
                        type: 2,
                        icon: #imageLiteral(resourceName: "BlueLogo"))
        
        switch type {
        case 1:
            pass.icon = #imageLiteral(resourceName: "brelloLogo")
            pass.image = #imageLiteral(resourceName: "logoCell")
            pass.name = "Single Pass"
            pass.shortDescription = "Base Brello"
            pass.description = "Base Brello"
            pass.type = type
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
            pass.description = "Group Brello 6"
            pass.type = type
        }
        return pass
    }
    func hideButtons() {
        for button in combineButtons{
            button.isHidden = true
        }
        refundButton.isHidden = true
        combineButton.isHidden = true
    }
    func combineSetUp() {
        for button in combineButtons{
            button.isHidden = true
            button.heroID = "hideEverything"
            button.heroModifiers = [HeroModifier.arc()]
        }
        refundButton.heroID = "hideEverything"
        refundButton.heroModifiers = [HeroModifier.arc()]
        combineButton.heroID = "hideEverything"
        combineButton.heroModifiers = [HeroModifier.arc()]
        var checkDouble = 0
        for pass in City.passes {
            if pass.type == passType {
                checkDouble += 1
            }
        }
        var red = false
        var blue = false
        var green = false
        var gold = false
        var orange = false
        var pink = false
        var i = 0
        
        for pass in City.passes {
            if pass.type == 1 && red == false {
                if pass.type == passType {
                    if checkDouble > 2 {
                        red = true
                        combos.append(pass)
                        if i < combineButtons.count {
                            combineButtons[i].isHidden = false
                            combineButtons[i].backgroundColor = Colours.brelloRed()
                            combineButtons[i].tag = 1
                            i += 1

                        }
                    }
                } else {
                    red = true
                    combos.append(pass)
                    if i < combineButtons.count {
                        combineButtons[i].isHidden = false
                        combineButtons[i].backgroundColor = Colours.brelloRed()
                        combineButtons[i].tag = 1

                        i += 1

                    }
                }
            }
            if pass.type == 2 && blue == false {
                if pass.type == passType {
                    if checkDouble > 2 {
                        blue = true
                        combos.append(pass)
                        if i < combineButtons.count {
                            combineButtons[i].isHidden = false
                            combineButtons[i].backgroundColor = Colours.brelloBlue()
                            combineButtons[i].tag = 2

                            i += 1

                        }
                    }
                } else {
                    blue = true
                    combos.append(pass)
                    if i < combineButtons.count {
                        combineButtons[i].isHidden = false
                        combineButtons[i].backgroundColor = Colours.brelloBlue()
                        combineButtons[i].tag = 2

                        i += 1

                    }
                }
            }
            if pass.type == 3 && green == false {
                if pass.type == passType {
                    if checkDouble > 2 {
                        green = true
                        combos.append(pass)
                        if i < combineButtons.count {
                            combineButtons[i].isHidden = false
                            combineButtons[i].backgroundColor = Colours.brelloGreen()
                            combineButtons[i].tag = 3

                            i += 1

                        }
                    }
                } else {
                    green = true
                    combos.append(pass)
                    if i < combineButtons.count {
                        combineButtons[i].isHidden = false
                        combineButtons[i].backgroundColor = Colours.brelloGreen()
                        combineButtons[i].tag = 3

                        i += 1

                    }
                }
            }
            if pass.type == 4 && gold == false {
                if pass.type == passType {
                    if checkDouble > 2 {
                        gold = true
                        combos.append(pass)
                        if i < combineButtons.count {
                            combineButtons[i].isHidden = false
                            combineButtons[i].backgroundColor = Colours.brelloGold()
                            combineButtons[i].tag = 4

                            i += 1

                        }
                    }
                } else {
                    gold = true
                    combos.append(pass)
                    if i < combineButtons.count {
                        combineButtons[i].isHidden = false
                        combineButtons[i].backgroundColor = Colours.brelloGold()
                        combineButtons[i].tag = 4

                        i += 1

                    }
                }            }
            if pass.type == 5 && orange == false {
                if pass.type == passType {
                    if checkDouble > 2 {
                        orange = true
                        combos.append(pass)
                        if i < combineButtons.count {
                            combineButtons[i].isHidden = false
                            combineButtons[i].backgroundColor = Colours.brelloOrange()
                            combineButtons[i].tag = 5

                            i += 1

                        }
                    }
                } else {
                    orange = true
                    combos.append(pass)
                    if i < combineButtons.count {
                        combineButtons[i].isHidden = false
                        combineButtons[i].backgroundColor = Colours.brelloOrange()
                        combineButtons[i].tag = 5

                        i += 1

                    }
                }
            }
            if pass.type > 5 && pink == false {
                if pass.type == passType {
                    if checkDouble > 2 {
                        pink = true
                        combos.append(pass)
                        if i < combineButtons.count {
                            combineButtons[i].isHidden = false
                            combineButtons[i].backgroundColor = Colours.brelloPink()
                            combineButtons[i].tag = 6

                            i += 1

                        }
                    }
                } else {
                    pink = true
                    combos.append(pass)
                    if i < combineButtons.count {
                        combineButtons[i].isHidden = false
                        combineButtons[i].backgroundColor = Colours.brelloPink()
                        combineButtons[i].tag = 6

                        i += 1
                    }
                }
            }
        }
    }
}
