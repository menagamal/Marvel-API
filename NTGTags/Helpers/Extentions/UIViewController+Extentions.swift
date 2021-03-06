//
//  UIViewController+Extentions.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    static var identifier: String {
          return String(describing: self)
      }
    class func instanceXib<T: UIViewController>() -> T {
        return T(nibName: T.identifier, bundle: nil)
    }
    
    func showErrorMessage(error:String, btnAction:(()->Void)! = nil){
        let alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
        let done = UIAlertAction(title: NSLocalizedString("ok", comment: "ok"), style: .default) { (action) in
            if btnAction != nil {
                btnAction()
            }
        }
        alert.addAction(done)
        self.present(alert,animated: true)
    }
}
