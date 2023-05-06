//
//  ViewController.swift
//  RxSwift-News
//
//  Created by Baris on 6.05.2023.
//

import UIKit


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
    }
    
    //MARK: - Actions
    
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
