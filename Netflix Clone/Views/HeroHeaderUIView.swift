//
//  HeroHeaderUIView.swift
//  Netflix Clone
//
//  Created by Amr Hossam on 01/12/2021.
//

import UIKit
import SDWebImage

class HeroHeaderUIView: UIView {
    
    @IBOutlet weak var heroImageView: UIImageView!
    
    
    static let identifier = "HeroHeaderUIView"
    
    public func addGradient(_ imageView: UIImageView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        imageView.layer.addSublayer(gradientLayer)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configure(model: TitleViewModel, width: Int) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        heroImageView.sd_setImage(with: url, completed: nil)
        let imageTransformer = SDImageResizingTransformer(size: CGSize(width: width, height: 500),scaleMode: .aspectFill)
        heroImageView.sd_setImage(with: url, placeholderImage: nil, context: [.imageTransformer: imageTransformer])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
