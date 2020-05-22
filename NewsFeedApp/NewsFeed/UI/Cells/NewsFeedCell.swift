//
//  NewsFeedCell.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 17/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

class NewsFeedCell: UITableViewCell {
    
    let newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let newsTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .boldSystemFont(ofSize: 16)
        DispatchQueue.main.async {
            title.textColor = .black
        }
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.textColor = .white
        return title
    }()
    
    let favoriteButton: UIButton = {
        let image = UIButton()
        image.setImage(UIImage(named: "notFavorite"), for: .normal)
        image.setImage(UIImage(named: "Favorite"), for: .selected)
        image.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 35, height: 35))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        layoutSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(newsImage)
        contentView.addSubview(favoriteButton)
        contentView.addSubview(newsTitle)
        contentView.backgroundColor = .white
    }
    
    func setupConstraints(){
        
        newsImage.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview()
            maker.leading.equalToSuperview().offset(15)
            maker.trailing.equalToSuperview().offset(-15)
            maker.width.equalTo(200)
            maker.height.equalTo(100)
        }
        
        newsTitle.snp.makeConstraints{(maker) in
            maker.top.equalTo(newsImage.snp_bottomMargin).offset(20)
            maker.trailing.equalToSuperview().offset(-30)
            maker.leading.equalToSuperview().offset(15)
        }
        
        favoriteButton.snp.makeConstraints{(maker) in
            maker.top.equalTo(newsTitle.snp_bottomMargin).offset(10)
            maker.centerX.equalToSuperview()
            maker.bottom.equalToSuperview().inset(10)
        }
    }
    
    func configureCell(news: NewsListView){
        layer.borderWidth = 10
        selectionStyle = .none
        newsTitle.text = news.title
        newsImage.downloaded(from: news.urlToImage)
    }
    
}



