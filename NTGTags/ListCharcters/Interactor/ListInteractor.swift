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
    func getAllCharacters(offset:Int,completation:@escaping( (ListCharactersResponse)-> Void))
}

class ListInteractor: ListUseCase {
    
    var provider = MoyaProvider<ListTarget>(callbackQueue: DispatchQueue.global(qos: .utility))
    private var allCharacters = [Results]()
    
    
    func getAllCharacters(offset:Int,completation: @escaping ((ListCharactersResponse) -> Void)) {
        LoadingView.shared.startLoading()
        provider.request(.getAllCharacters(offset: offset)) { result in
            
            
            switch(result) {
                
            case .success(let response):
                
                DispatchQueue.main.async {
                    LoadingView.shared.stopLoading()
                    do {
                        if response.statusCode == AppConstant.API.Codes.success.rawValue {
                            let responseModel: FetchModel = try response.map(FetchModel.self)
                            let cacheManager = CacheManager()
                            cacheManager.saveData(array: (responseModel.data?.results)!, key: "cache")
                            for item in (responseModel.data?.results)! {
                                self.allCharacters.append(item)
                            }
                            completation((nil,self.allCharacters))
                        } else {
                            completation((ListConstant.ListError.InvalidURL,[Results]()))
                        }
                    } catch{
                        completation((ListConstant.ListError.ParsingError,[Results]()))
                    }
                }
            case .failure(_):
                
                DispatchQueue.main.async {
                    LoadingView.shared.stopLoading()
                    print("llll")
                    completation((ListConstant.ListError.InvalidURL,[Results]()))
                }
            }
        }
    }
    
}
