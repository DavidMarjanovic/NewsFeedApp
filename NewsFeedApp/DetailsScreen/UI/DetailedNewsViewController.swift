//
//  DetailedNewsViewController.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 21/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import WebKit

class DetailedNewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let alert: UIAlertController = {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        return alert
    }()
    
    func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    let networkManager = NetworkManager()
    var screenData = [NewsCellItem]()
    var news: NewsListView
    let viewModel = DetailedNewsViewModel()
    
    init(news: NewsListView) {
        self.news = news
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        //self.screenData = createScreenData(movie: self.movie)
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.screenData = self.viewModel.createScreenData(news: news)
        setupTableView()
        setupConstraints()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints{(maker) in
            maker.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func setupTableView(){
        tableView.register(TitleCell.self, forCellReuseIdentifier: "TitleCell")
        tableView.register(ImageCell.self, forCellReuseIdentifier: "ImageCell")
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: "DescriptionCell")
        tableView.register(SourceCell.self, forCellReuseIdentifier: "SourceCell")
        tableView.register(UrlCell.self, forCellReuseIdentifier: "UrlCell")
        tableView.register(AuthorCell.self, forCellReuseIdentifier: "AuthorCell")
        tableView.register(PublishTimeCell.self, forCellReuseIdentifier: "PublishTimeCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return screenData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = screenData[indexPath.row]
        switch item.type {
        case .image:
            guard let safeData = item.data as? String else {
                return UITableViewCell()
            }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as? ImageCell else {
                fatalError("The dequeued cell is not an instance of CollectionViewCell.")
            }
            cell.configureCell(image: safeData)
            return cell
        case .title:
            guard let safeData = item.data as? String else {
                return UITableViewCell()
            }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as? TitleCell else {
                fatalError("The dequeued cell is not an instance of CollectionViewCell.")
            }
            cell.configureCell(text: safeData)
            return cell
        case .author:
            guard let safeData = item.data as? String else {
                return UITableViewCell()
            }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorCell", for: indexPath) as? AuthorCell else {
                fatalError("The dequeued cell is not an instance of CollectionViewCell.")
            }
            cell.configureCell(text: safeData)
            return cell
        case .time:
            guard let safeData = item.data as? String else {
                return UITableViewCell()
            }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PublishTimeCell", for: indexPath) as? PublishTimeCell else {
                fatalError("The dequeued cell is not an instance of CollectionViewCell.")
            }
            cell.configureCell(text: safeData)
            return cell
        case .description:
            guard let safeData = item.data as? String else {
                return UITableViewCell()
            }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as? DescriptionCell else {
                fatalError("The dequeued cell is not an instance of CollectionViewCell.")
            }
            cell.configureCell(text: safeData)
            return cell
        case .link:
            guard let safeData = item.data as? String else {
                return UITableViewCell()
            }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UrlCell", for: indexPath) as? UrlCell else {
                fatalError("The dequeued cell is not an instance of CollectionViewCell.")
            }
            cell.configureCell(text: safeData)
            return cell
        case .source:
            guard let safeData = item.data as? String else {
                return UITableViewCell()
            }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SourceCell", for: indexPath) as? SourceCell else {
                fatalError("The dequeued cell is not an instance of CollectionViewCell.")
            }
            cell.configureCell(text: safeData)
            return cell
        }
        
    }
    
}
