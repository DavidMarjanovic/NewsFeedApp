//
//  ImageCell.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 21/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ImageCell: UITableViewCell {
    
    let newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func configureCell(image: String) {
        selectionStyle = .none
        newsImage.downloaded(from: image)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(newsImage)
        setupConstraints()
    }
    
    func setupConstraints() {
        newsImage.snp.makeConstraints { (maker) in
            maker.top.bottom.leading.trailing.equalToSuperview()
            maker.height.equalTo(200)
        }
    }
    
}


