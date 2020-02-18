//
//  SearchInteractor.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/17/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//



import Foundation
import Moya


protocol SearchUseCase {
    func searchCharacters(name:String,completation:@escaping( (ListCharactersResponse)-> Void))
}

class SearchInteractor: SearchUseCase {
    var provider = MoyaProvider<SearchTarget>(callbackQueue: DispatchQueue.global(qos: .utility))
    
    func searchCharacters(name: String, completation: @escaping ((ListCharactersResponse) -> Void)) {
        provider.request(.searchCharacters(name: name)) { result in
            
            
            switch(result) {
                
            case .success(let response):
                
                DispatchQueue.main.async {
                    do {
                        if response.statusCode == AppConstant.API.Codes.success.rawValue {
                            let responseModel: FetchModel = try response.map(FetchModel.self)
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
