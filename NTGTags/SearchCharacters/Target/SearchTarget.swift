//
//  SearchTarget.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/18/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import Moya


enum SearchTarget :TargetType {
    
    case searchCharacters(name:String)
    
    var baseURL: URL {
        return URL(string: "https://gateway.marvel.com/v1/public/")!
    }
    
    var path: String {
        switch self {
            
        case .searchCharacters:
            return "characters"
            
        }
    }
    
    var method: MoyaMethod {
        switch self {
            
        case  .searchCharacters:
            return .get
            
        }
    }
    
    var sampleData: Data {
        switch self {
        case .searchCharacters:
            return  ListConstant.API.getAllCharacters.SampleData.data(using: String.Encoding.utf8)!
            
        }
    }
    
    var task: Task {
        switch self {
        case .searchCharacters(let name):
            return .requestParameters(
            parameters: [
              "ts": "1",
              "apikey": "ed8f20889bceae63f003ebea467f8380",
              "hash": "ced5d602b1c08aca9fbbf658b3019f7e",
              "name":"\(name)"
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

