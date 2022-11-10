//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Amr Hossam on 24/12/2021.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    @IBOutlet private weak var playTitleButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var titlesPosterUIImageView: UIImageView!

    static let identifier = "TitleTableViewCell"

    public func configure(with model: TitleViewModel) {

        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        titlesPosterUIImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
}
