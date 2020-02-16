//
//  DetailsCellDataSource.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/16/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

class DetailsCellDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    
    var items = [Items]()
    var collection:UICollectionView!
    var img:String!
    override init() {
        super.init()
    }
    
    init(collection:UICollectionView,items:[Items],img:String) {
        super.init()
        self.img = img
        
        self.collection = collection
        
        self.items = items
        
        self.collection.register(UINib(nibName: "DetailsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetailsCollectionViewCell")
        
        self.collection.dataSource = self
        
        self.collection.delegate = self
        self.collection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCollectionViewCell",for: indexPath) as! DetailsCollectionViewCell
        let item = items[indexPath.row]
        
        cell.setDetails(title: item.name!, imgUrl: self.img!, completation: { img in
            let imageData = img.pngData()
            let imageToBaseStr = imageData!.base64EncodedString(options: .lineLength76Characters)
            self.items[indexPath.row].characterImageBaseString = imageToBaseStr
        })
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 1
        let collectionViewSize = collectionView.frame.size.width/3 - padding
        return CGSize(width: collectionViewSize, height: collectionView.frame.size.height - padding)
        
    }
    
    
}
