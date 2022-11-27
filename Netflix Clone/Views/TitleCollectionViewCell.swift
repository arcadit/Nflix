//
//  TitleCollectionViewCell.swift
//  Netflix Clone
//
//  Created by 木科誠 on 2022/11/26.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    
    static let identifier = "TitleCollectionViewCell"
    
    public func configure(with model: String) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
            return
        }
        
        posterImageView.sd_setImage(with: url, completed: nil)
    }

}
