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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = {
            var qrCode = QRCode("This is proof of single pass")!
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

