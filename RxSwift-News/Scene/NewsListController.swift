//
//  ViewController.swift
//  RxSwift-News
//
//  Created by Baris on 6.05.2023.
//

import UIKit
import RxSwift
import RxCocoa

private let disposeBag = DisposeBag()
private let identifier = "cell"

class NewsListController: UIViewController {
    //MARK: - UI Elements
    private let tableView = UITableView()
    //MARK: - Properties
    private var articleViewModel : ArticleListViewModel!
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.tableView.dataSource = self
        
    }
    
    //MARK: - Functions
    private func setup() {
        style()
        layout()
        populateNews()
    }
    
    //MARK: - Actions
    
}

//MARK: - GetData
extension NewsListController {
    private func populateNews() {
        let resource = Resource<ArticlesList>(url: URL(string: NEWS_URL )!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { articleResponse in
                
                let articles = articleResponse.articles
                self.articleViewModel = ArticleListViewModel(articles)
                print(articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }).disposed(by: disposeBag)
        
    }
}

//MARK: - Helpers
extension NewsListController {
    private func style() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "News"
        view.addSubview(tableView)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
    }
    
    private func layout() {
        tableView.frame = view.bounds
    }
}

//MARK: - UITableViewDataSource
extension NewsListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleViewModel == nil ? 0: self.articleViewModel.articlesVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let articleVM = self.articleViewModel.articleAt(indexPath.row)
        cell.textLabel?.text = articleVM.article.title
        cell.detailTextLabel?.text = articleVM.article.description
        return cell
    }
}

