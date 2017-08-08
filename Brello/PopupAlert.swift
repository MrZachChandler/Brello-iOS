//
//  PopupAlert.swift
//  Brello
//
//  Created by Zach Chandler on 7/16/17.
//  Copyright © 2017 Mad Men Software. All rights reserved.
//

import PopupDialog

/// A class for easilly dsplaying alerts with static methods
class PopupAlert
{
    
    /**
     Presents an alert on top of an existing view controller with a title,
     message, and ack button
     - parameters:
     - on: the view controller to present on
     - title: the title of the alert
     - message: the corresponding descriptive message of the alert
     */
    class func show(on viewController: UIViewController, title: String?, message: String?)
    {
        // create a popup with the given title and message
        let popup = PopupDialog(title: title, message: message)
        
        // add an acknowledgement button with a callback
        let acknowledge = DefaultButton(title: "Ok")
        {
            //print("\(title) dialog acknowledged")
        }
        popup.addButton(acknowledge)
        // Present dialog
        viewController.present(popup, animated: true, completion: nil)
    }
    
}
