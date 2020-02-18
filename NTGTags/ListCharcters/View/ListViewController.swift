//
//  ViewController.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit
import Alamofire
class ListViewController: UIViewController,ListView{
    
    
    var presenter: ListPresenter?
    
    @IBOutlet weak var charactersTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ListBuilder().build(navigator: self.navigationController!, vc: self)
        
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
        let image = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(searchCharacters(_:)))
        navigationItem.rightBarButtonItems = [button]
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if NetworkReachabilityManager()!.isReachable {
            self.presenter?.getGetAllCharacters()
            
        } else {
            presenter?.loadCachedData()
        }
    }
    
    @objc func searchCharacters(_ sender: Any) {
        if NetworkReachabilityManager()!.isReachable {
            self.presenter?.searchCharacters()
        } else {
            Toast.showAlert(viewController: self, text: "Check your internet connection to be able to search.")
        }
        
    }
    func showError(str: String) {
        Toast.showAlert(viewController: self, text: str)
    }
    
}

