//
//  DetailsViewController.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/16/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController ,DetailsView{
    var presenter: DetailsPresenter?
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    
    @IBOutlet weak var eventsCollection: UICollectionView!
    @IBOutlet weak var storiesCollection: UICollectionView!
    @IBOutlet weak var seriesCollection: UICollectionView!
    @IBOutlet weak var comicsCollection: UICollectionView!
    
    @IBOutlet weak var connectIinkView: UIView!
    @IBOutlet weak var wikiLink: UIView!
    @IBOutlet weak var detailsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadDetailsLayout()
        connectIinkView.addTapGestureRecognizer {
            
        }
        wikiLink.addTapGestureRecognizer {
            
        }
        
        detailsView.addTapGestureRecognizer {
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func dismissVc(_ sender: Any) {
        let _ = navigationController!.popViewController(animated: true)
    }
    
}
