//
//  DiskCacheManager.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//



import Foundation
import UIKit
import DataCache



class CacheManager {
    
    
    
    init() {
        
    }
    func saveData(array:[Results],key:String) {
        let model = CacheModel(results: array)
        DataCache.instance.write(object: model, forKey: key)
        
    }
    
    func loadData(key:String) -> [Results]? {
        if let data = DataCache.instance.readData(forKey: key)  {
            if let obj = NSKeyedUnarchiver.unarchiveObject(with: data) as? CacheModel {
                return obj.results
            } else {
                return nil
            }
            
        }
         return nil
    }
    
}

class CacheModel:NSObject,NSCoding {
    
    var results:[Results]
    
    init(results:[Results]) {
        self.results = results
    }
    public required init?(coder aDecoder: NSCoder) {
        
        
        self.results = (aDecoder.decodeObject(forKey: "results") as? [Results])!
    }
    
    open func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.results, forKey: "results")
        
        
    }
}
