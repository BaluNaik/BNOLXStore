//
//  ListViewController.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import UIKit

class ListViewController: UIViewController {
    
    var presenter: ListViewPresenterInput?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "STORE"
        tableView.delegate = self
        tableView.dataSource = self
        self.presenter?.eventLoadData()
    }
    
}


// MARK: - ListViewPresenterOutput

extension ListViewController: ListViewPresenterOutput {
    
    func showLoader(status: Bool) {
        if status {
            loader.startAnimating()
        } else {
            loader.stopAnimating()
        }
        self.view.isUserInteractionEnabled = !status
    }
    
    func showError(message: String) {
        let alertVC = UIAlertController(title: "BNOLXSTORE", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func reloadContent() {
        self.tableView.reloadData()
    }
    
}


// MARK: - UITableViewDataSource & UITableViewDelegate

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.presenter?.rows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let classifiedCell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ClassifiedCell,
           let data = self.presenter?.getClassifiedObject(for: indexPath.row) {
            classifiedCell.configCell(data: data)
            cell = classifiedCell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = self.presenter?.getClassifiedObject(for: indexPath.row) {
            self.presenter?.showDetailsScreen(data: data)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
}
