//
//  DetailsPresenter.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/16/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit
protocol DetailsPresenterDelegate {
    
    
}

class DetailsPresenter: DetailsPresenterDelegate{
    
    //private var cachedObj:ArrayOfCachedModule!
    private var interactor:DetailsInteractor?
    private var router:DetailsRouter?
    
    //MARK: TO AVOID RETAIN CYCLE
    private weak var view:DetailsView?
    var character:Results
    
    private var comicsDataSource:DetailsCellDataSource!
    private var seriesDataSource:DetailsCellDataSource!
    private var storiesDataSource:DetailsCellDataSource!
    private var eventsDataSource:DetailsCellDataSource!
    
    init(interactor:DetailsInteractor,router:DetailsRouter,view:DetailsView,character:Results) {
        self.interactor = interactor
        self.router = router
        self.view = view
        self.character = character
    }
    
    func loadDetailsLayout()  {
        
        if self.character.characterImageBaseString != nil {
            
            let dataDecoded : Data = Data(base64Encoded: character.characterImageBaseString, options: .ignoreUnknownCharacters)!
            let decodedimage:UIImage = UIImage(data: dataDecoded)!
            self.view?.mainImageView.image = decodedimage
            
        } else {
            self.view?.mainImageView.setImageWithUrl(url: character.resourceURI!)
            
        }
        self.view?.labelName.text = self.character.name
        self.view?.labelDesc.text = self.character.descriptionStr
        
        // MARK: MARVEL APU ISSUE
        // marvel doesn't send the url of the comic , event , stories or series
        // it require a new API call for each item which is Totaly wrong .!!!!!!!!!!!!!!!!!!!!
        
        let url = "\(character.thumbnail!.path!).\(character.thumbnail!.extensionStr!)"
        
        
        self.comicsDataSource = DetailsCellDataSource(collection: self.view!.comicsCollection, items: self.character.comics!.items!,img:url)
        self.seriesDataSource = DetailsCellDataSource(collection: self.view!.seriesCollection, items: self.character.series!.items!,img:url)
        self.storiesDataSource = DetailsCellDataSource(collection: self.view!.storiesCollection, items: self.character.stories!.items!,img:url)
        self.eventsDataSource = DetailsCellDataSource(collection: self.view!.eventsCollection, items: self.character.events!.items!,img:url)
        
    }
    
}
