//
//  ListViewController.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import UIKit

class ListViewController: UIViewController, ListViewPresenterOutput {
    
    var presenter: ListViewPresenterInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "STORE"
    }

}
