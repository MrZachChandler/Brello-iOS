//
//  QRDetailViewController.swift
//  Brello
//
//  Created by Zach Chandler on 7/15/17.
//  Copyright © 2017 Mad Men Software. All rights reserved.
//

import UIKit
import QRCode
import AVFoundation
import QRCodeReader
import Hero

class QRDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var brelloLabel: UILabel!
    
    var color = Colours.brelloRed()
    var name = "Single Brello"
    var desc = "Base Brello"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = desc
        brelloLabel.text = name
        self.view.backgroundColor = color
        
        imageView.image = {
            var qrCode = QRCode(name)!
            qrCode.size = self.imageView.bounds.size
            qrCode.errorCorrection = .High
            return qrCode.image
        }()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

