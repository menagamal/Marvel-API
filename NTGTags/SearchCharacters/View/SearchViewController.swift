//
//  SearchViewController.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/17/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, SearchView ,UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    var presenter:SearchPresenter?
    
    @IBOutlet weak var searchTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            self.presenter?.searchCharacterWithName(name: searchText)
        }
    }
}
