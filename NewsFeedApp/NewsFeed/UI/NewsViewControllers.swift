//
//  ChildViewControllers.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 15/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip
import SnapKit
import RxSwift

class ChildViewControllers: UIViewController, UITableViewDelegate, UITableViewDataSource, IndicatorInfoProvider{

    var loader: UIAlertController?
    private let disposeBag = DisposeBag()
    var childNumber: String = ""
    var newsSource: String = ""
    let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    let networkManager = NetworkManager()
    var screenData: [NewsListView] = []
    let viewModel = NewsFeedViewModel()
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "\(childNumber)")
    }
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let alert: UIAlertController = {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getData()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func getData() {
        indicator.startAnimating()
        networkManager.getData(from: "https://newsapi.org/v2/top-headlines?sources=\(newsSource)&apiKey=") {[unowned self] (data, newsError) in
            guard let safeData = data else {
                self.alert.title = "Error while getting news"
                self.alert.message = newsError
                self.present(self.alert, animated: true, completion: nil)
                return
            }
            self.screenData = self.viewModel.createScreenData(data: safeData)
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.tableView.reloadData()
            }
        }
    }
    
    init(source: String) {
        self.newsSource = source
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        view.addSubview(tableView)
        setupConstraints()
        setupTableView()
    }
    
    func setupTableView(){
        tableView.register(NewsFeedCell.self, forCellReuseIdentifier: "Cell Class")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    func setupConstraints(){
        tableView.snp.makeConstraints{(maker) in
            maker.leading.trailing.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return screenData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let news = screenData[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell Class", for: indexPath) as? NewsFeedCell else {
            fatalError("The dequeued cell is not an instance of CollectionViewCell.")
        }
        cell.configureCell(news: news)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewController = DetailedNewsViewController(news: screenData[indexPath.row])
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

