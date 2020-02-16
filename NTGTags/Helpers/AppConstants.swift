//
//  AppConstants.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

enum AppConstant {
    enum API {
        static let BaseUrl = "https://gateway.marvel.com/v1/public/"
        static let ts = "1"
        static let apiKey = "ed8f20889bceae63f003ebea467f8380"
        static let hash = "ced5d602b1c08aca9fbbf658b3019f7e"
        
        enum Codes: Int {
            case success = 200
            case failed = 404
        }
    }
    
    enum Regex{
        static let Email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        static let Password = "^(?=.*[A-Z])[a-zA-Z\\d]{8,}$"
    }
    
}

