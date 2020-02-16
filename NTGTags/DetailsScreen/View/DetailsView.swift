//
//  DetailsView.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/16/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit
protocol DetailsView :class{
    
    var mainImageView: UIImageView! {
        get set
    }
    
    var labelName: UILabel! {
        get set
    }
    
    var labelDesc: UILabel! {
        get set
    }
    
    
    var eventsCollection: UICollectionView! {
        get set
    }
    
    var storiesCollection: UICollectionView! {
        get set
    }
    
    var seriesCollection: UICollectionView! {
        get set
    }
    
    var comicsCollection: UICollectionView! {
        get set
    }
    
    
    
}

