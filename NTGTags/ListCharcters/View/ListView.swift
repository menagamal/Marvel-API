//
//  ListView.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit
protocol ListView :class{
    
    var charactersTableView: UITableView! {
        get set
    }
    
    func showError(str:String)  
}
