//
//  CharacterDataSource.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//



import Foundation
import UIKit

class CharacterDataSource:  NSObject, UITableViewDataSource,UITableViewDelegate {
    
    var delegate: CharactersDatasourceDelegate!
    
    var tableView: UITableView!
    
    var results = [Results]()
    
    init(delegate:CharactersDatasourceDelegate,tableView:UITableView,results : [Results]) {
        super.init()
        
        self.results = results
        self.delegate = delegate
        self.tableView = tableView
        self.tableView.register(UINib(nibName: "CharactersTableViewCell", bundle: nil), forCellReuseIdentifier: "CharactersTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharactersTableViewCell", for: indexPath) as! CharactersTableViewCell
        let character = results[indexPath.row]
        let url = "\(character.thumbnail!.path!).\(character.thumbnail!.extensionStr!)"
        cell.setDetails(title: character.name!, imgUrl: url, completation: { img in
            let imageData = img.pngData()
            let imageToBaseStr = imageData!.base64EncodedString(options: .lineLength76Characters)
            self.results[indexPath.row].characterImageBaseString = imageToBaseStr
        })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelectCharacter(charcter: results[indexPath.row])
    }
    
}

protocol CharactersDatasourceDelegate {
    func didSelectCharacter(charcter:Results)
}
