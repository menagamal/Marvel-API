//
//  ListTarget.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import Moya

typealias MoyaMethod = Moya.Method

enum ListTarget :TargetType {
    
    case getAllCharacters
    
    var baseURL: URL {
        return URL(string: "https://gateway.marvel.com/v1/public/")!
    }
    
    var path: String {
        switch self {
            
        case .getAllCharacters:
            return "characters"//ListConstant.API.getAllCharacters.endPoint + "?ts=\(AppConstant.API.ts)&apikey=\(AppConstant.API.apiKey)&hash=\(AppConstant.API.hash)"
            
        }
    }
    
    var method: MoyaMethod {
        switch self {
            
        case  .getAllCharacters:
            return .get
            
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getAllCharacters:
            return  ListConstant.API.getAllCharacters.SampleData.data(using: String.Encoding.utf8)!
            
        }
    }
    
    var task: Task {
        switch self {
        case .getAllCharacters:
            return .requestParameters(
            parameters: [
              "ts": "1",
              "apikey": "ed8f20889bceae63f003ebea467f8380",
              "hash": "ced5d602b1c08aca9fbbf658b3019f7e",
              ] ,
            encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        
        return [String:String]()
    }
    
    // 7
    public var validationType: ValidationType {
        return .successCodes
    }
}

