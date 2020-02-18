//
//  Toast.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/18/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

public class Toast {
  
    public static let color = UIColor.red
    public static let mainColor = UIColor.red
    
    public static func showAlert(viewController: UIViewController,  title: String! = nil, text: String) {
        
        let action = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil)
        
        action.setValue(UIColor(red: 0x51 / 255, green: 0xcf / 255, blue: 0x98 / 255, alpha: 1), forKey: "titleTextColor")
        
        Toast.showAlert(viewController: viewController, text: text, style: UIAlertController.Style.actionSheet, action)
    }
    
    public static func showAlert(viewController: UIViewController, title: String! = nil, text: String, style: UIAlertController.Style, _ actions: UIAlertAction...) {
        
        let alert = UIAlertController(title: title, message: text, preferredStyle: style)
        
        if actions.count == 1 {
            
            let action = actions[0]
            
            action.setValue(mainColor, forKey: "titleTextColor")
            
            alert.addAction(action)
            
            alert.preferredAction = action
        } else {
            
            for i in 0..<actions.count {
                let action = actions[i]
                if i == 0 {
                    
                    action.setValue(mainColor, forKey: "titleTextColor")
                } else {
                    
                    action.setValue(mainColor, forKey: "titleTextColor")
                }
                
                alert.addAction(action)
                alert.preferredAction = action
            }
        }
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    public static func showAlert(viewController: UIViewController, title: String! = nil, text: String, fieldHint: String! , _ actions: UIAlertAction...) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            
            textField.placeholder = fieldHint
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        if actions.count == 1 {
            
            let action = actions[0]
            
            action.setValue(UIColor(red: 0x51 / 255, green: 0xcf / 255, blue: 0x98 / 255, alpha: 1), forKey: "titleTextColor")
            
            alert.addAction(action)
            
            alert.preferredAction = action
            
        } else {
            
            for i in 0..<actions.count {
                let action = actions[i]
                if i == 0 {
                    
                    action.setValue(UIColor(red: 0x51 / 255, green: 0xcf / 255, blue: 0x98 / 255, alpha: 0.6), forKey: "titleTextColor")
                } else {
                    
                    action.setValue(UIColor(red: 0x51 / 255, green: 0xcf / 255, blue: 0x98 / 255, alpha: 1), forKey: "titleTextColor")
                }
                
                alert.addAction(action)
                alert.preferredAction = action
            }
        }
        
        alert.view.backgroundColor = UIColor.white
        alert.view.layer.cornerRadius = 10
        
        viewController.present(alert, animated: true, completion: nil)
        
        
        return alert
    }
}
