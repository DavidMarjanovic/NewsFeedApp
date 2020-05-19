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
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    let newsTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Quicksand-Bold", size: 17)
        title.textColor = .white
        return title
    }()
    
    let newsDescription: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Quickand-Bold", size: 17)
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
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        newsImage.snp.makeConstraints{(maker) in
            maker.top.bottom.leading.equalToSuperview()
            maker.width.height.equalTo(155)
        }
        
        favoriteButton.snp.makeConstraints{(maker) in
            maker.bottom.equalToSuperview().inset(9)
            maker.trailing.equalToSuperview().offset(-40)
        }
        
        newsTitle.snp.makeConstraints{(maker) in
            maker.top.trailing.equalToSuperview().inset(15)
            maker.leading.equalTo(newsImage.snp.trailing).offset(15)
        }
        
        newsDescription.snp.makeConstraints{(maker) in
            maker.top.equalTo(newsTitle).offset(-20)
            maker.leading.trailing.equalToSuperview()
        }
    }
    
    public func setupView(with imageURL: String){
        loadImage(with: imageURL)
    }
    
    func loadImage(with imageURL: String){
            newsImage.image = UIImage(systemName: "square.and.pencil")
            if let imageURL = URL(string: imageURL) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let safeImage = UIImage(data: data)
                        DispatchQueue.main.async {[weak self] in
                            self?.newsImage.image = safeImage
                        }
                    }
                }
            }
        }
    
    func configureCell(news: NewsListView){
        layer.borderWidth = 8
        layer.cornerRadius = 20
        backgroundColor = UIColor(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        selectionStyle = .none
        newsTitle.text = news.title
        newsDescription.text = news.description
        newsImage.downloaded(from: news.urlToImage)
    }
    
    
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

