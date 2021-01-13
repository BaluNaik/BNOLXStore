//
//  ListViewPresenterIO.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import UIKit

protocol ListViewPresenterInput: NSObject {
    func eventLoadData()
    var rows: Int { get }
    func getClassifiedObject(for index: Int) -> ClassifiedData?
}

protocol ListViewPresenterOutput: NSObject {
    func showLoader(status: Bool)
    func showError(message: String)
    func reloadContent()
}
