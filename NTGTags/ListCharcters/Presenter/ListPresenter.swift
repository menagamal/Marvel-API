//
//  ListPresenter.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

protocol ListPresenterDelegate {
    func getGetAllCharacters()
    
}

class ListPresenter: ListPresenterDelegate ,CharactersDatasourceDelegate{
    
    //private var cachedObj:ArrayOfCachedModule!
    private var interactor:ListInteractor?
    private var router:ListRouter?
    
    //MARK: TO AVOID RETAIN CYCLE
    private weak var view:ListView?
    
    //MARK: Cached Items
    var isLoadingCachedItems = false
    private var dataSource:CharacterDataSource!
    
    //MARK: Paggination
    private var currentOffset = 0
    
    init(interactor:ListInteractor,router:ListRouter,view:ListView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    func getGetAllCharacters() {
        interactor?.getAllCharacters(offset: currentOffset, completation: { (response) in
            if response.0 == nil {
                
                let results = response.1
                self.currentOffset += 100
                self.dataSource = CharacterDataSource(delegate: self, tableView: self.view!.charactersTableView, results: results)
            } else {
                self.view?.showError(str: "Something went wrong, Try Again")
            }
        })
        
    }
    
    func loadCachedData() {
        let cacheManager = CacheManager()
        let arr = cacheManager.loadData(key: "cache")
        if let results = arr , !results.isEmpty {
            
            self.dataSource = CharacterDataSource(delegate: self, tableView: self.view!.charactersTableView, results: results)
        } else {
            self.view?.showError(str: "Please Connect to the internet to Sync Data")
        }
        
    }
    
    func didSelectCharacter(charcter: Results) {
        
        self.router?.navigate(to: .CharacterDetails(character: charcter))
    }
    
    func startPaggination() {
        interactor?.getAllCharacters(offset: currentOffset, completation: { (response) in
            if response.0 == nil {
                self.currentOffset += 100
                let results = response.1
                self.dataSource = CharacterDataSource(delegate: self, tableView: self.view!.charactersTableView, results: results)
            }
        })
    }
    
    func searchCharacters() {
        
        self.router?.navigate(to: .SearchCharacters)
    }
    
    
}
