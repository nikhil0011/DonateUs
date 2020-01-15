//
//  HomeCollectionViewCell.swift
//  DonateUs
//
//  Created by Nikhil on 15/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    var viewModel: CharityCellViewModel! {
        didSet {
            let data = viewModel.data
            self.organisationImageView.loadImage(url: data.logoURL)
            organisationLabel.text = data.name
        }
    }
    let organisationImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.contentMode  = .scaleAspectFit
        image.layer.masksToBounds = true
        image.image = UIImage(named: "locator_icon")
        return image
    }()
    let organisationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.sizeToFit()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let selectIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "right_circle_arrow")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.contentMode  = .scaleAspectFit
        image.layer.masksToBounds = true
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init decoder has been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    func setupView() {
        self.backgroundColor = .white
        addSubview(organisationImageView)
        addSubview(organisationLabel)
        addSubview(selectIcon)
        organisationImageView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 4, bottom: 0, right: 4), size: .init(width: 35, height: 35))
        organisationImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        organisationLabel.anchor(top: topAnchor, leading: organisationImageView.trailingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 4, left: 0, bottom: 4, right: 4))
        selectIcon.anchor(top: nil, leading: organisationLabel.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 4, bottom: 4, right: 4), size: .init(width: 15, height: 15))
        selectIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    func setUp(model: CharityCellViewModel) {
        self.viewModel = model
    }
}
