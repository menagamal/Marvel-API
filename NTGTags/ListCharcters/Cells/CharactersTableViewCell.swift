//
//  CharactersTableViewCell.swift
//  NTGTags
//
//  Created by Mena Gamal on 2/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    func setDetails(title:String,imgUrl:String,completation:@escaping((_ image:UIImage)->Void),imageBase64:String! = nil ) {
        labelTitle.text = title
        
        if imageBase64 != nil {
            
                let dataDecoded : Data = Data(base64Encoded: imageBase64!, options: .ignoreUnknownCharacters)!
                let decodedimage:UIImage = UIImage(data: dataDecoded)!
                self.characterImage.image = decodedimage
                
        } else {
            characterImage.sd_setImage(with: URL(string: imgUrl)!) { (img, error, cahce, url) in
                if error == nil {
                    completation(img!)
                }
            }

        }
    }
    
}
