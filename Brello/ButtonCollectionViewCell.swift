//
//  ButtonCollectionViewCell.swift
//  Brello
//
//  Created by Zach Chandler on 7/22/17.
//  Copyright © 2017 Mad Men Software. All rights reserved.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var logo: UIButton!
    
    func setIcon(image: String)  {
        let image = UIImage(named: image)
        logo.setImage(image, for: UIControlState.normal)
    }
}
