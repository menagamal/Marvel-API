//
//  ListInteractor.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import Moya

typealias ListCharactersResponse = (ListConstant.ListError?,[Results])

protocol ListUseCase {
    func getAllCharacters(completation:@escaping( (ListCharactersResponse)-> Void))
}

class ListInteractor: ListUseCase {
        
    var provider = MoyaProvider<ListTarget>(callbackQueue: DispatchQueue.global(qos: .utility))
    
    func getAllCharacters(completation: @escaping ((ListCharactersResponse) -> Void)) {
        provider.request(.getAllCharacters) { result in
            
            
            switch(result) {
                
            case .success(let response):
                
                DispatchQueue.main.async {
                    do {
                        if response.statusCode == AppConstant.API.Codes.success.rawValue {
                            let responseModel: FetchModel = try response.map(FetchModel.self)
                            let cacheManager = CacheManager()
                            cacheManager.saveData(array: (responseModel.data?.results)!, key: "cache")
                            
                            completation((nil,(responseModel.data?.results)!))
                        } else {
                            completation((ListConstant.ListError.InvalidURL,[Results]()))
                        }
                    } catch{
                        completation((ListConstant.ListError.ParsingError,[Results]()))
                    }
                }
            case .failure(_):
                
                DispatchQueue.main.async {
                    print("llll")
                    completation((ListConstant.ListError.InvalidURL,[Results]()))
                }
            }
        }
    }
    
}
