//
//  SearchCellDataSource.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/17/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

class SearchCellDataSource:  NSObject, UITableViewDataSource,UITableViewDelegate {
    
    var delegate: SearchDatasourceDelegate!
    
    var tableView: UITableView!
    
    var results = [Results]()
    
    init(delegate:SearchDatasourceDelegate,tableView:UITableView,results : [Results]) {
        super.init()
        
        self.results = results
        self.delegate = delegate
        self.tableView = tableView
        self.tableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        let character = results[indexPath.row]
        let url = "\(character.thumbnail!.path!).\(character.thumbnail!.extensionStr!)"
        cell.labelTitle.text = character.name
        cell.mainImageView.setImageWithUrl(url: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelectCharacter(charcter: results[indexPath.row])
    }
    
}

protocol SearchDatasourceDelegate {
    func didSelectCharacter(charcter:Results)
}
