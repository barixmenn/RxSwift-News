//
//  ViewController.swift
//  RxSwift-News
//
//  Created by Baris on 6.05.2023.
//

import UIKit
import RxSwift

private let disposeBag = DisposeBag()

class NewsListController: UIViewController {
    //MARK: - UI Elements
    private let tableView = UITableView()
    //MARK: - Properties
    
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
    }
    
    private func layout() {
        tableView.frame = view.bounds
    }
}

//MARK: - UITableViewDataSource
extension NewsListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "test"
        return cell
    }
}
