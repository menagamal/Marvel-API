//
//  SearchPresenter.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/17/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import UIKit
protocol SearchPresenterDelegate {
    func searchCharacterWithName(name:String)  
    
}

class SearchPresenter: SearchPresenterDelegate , SearchDatasourceDelegate{
    
    //private var cachedObj:ArrayOfCachedModule!
    private var interactor:SearchInteractor?
    private var router:SearchRouter?
    
    //MARK: TO AVOID RETAIN CYCLE
    private weak var view:SearchView?
    
    private var dataSource:SearchCellDataSource!
    
    
    init(interactor:SearchInteractor,router:SearchRouter,view:SearchView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    func searchCharacterWithName(name:String)  {
        interactor?.searchCharacters(name: name, completation: { (response) in
            if response.0 == nil {
                
                let results = response.1
                self.dataSource = SearchCellDataSource(delegate: self, tableView: self.view!.searchTable, results: results)
            } else {
                
            }
        })
    }
    
    func didSelectCharacter(charcter: Results) {
        self.router?.navigate(to: .CharacterDetails(character: charcter))
    }
    
    
    
}
