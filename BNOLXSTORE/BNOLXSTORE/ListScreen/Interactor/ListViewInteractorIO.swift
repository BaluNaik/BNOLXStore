//
//  ListViewInteractorIO.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import UIKit

protocol ListViewInteractorInput: NSObject {
    var rows: Int { get }
    func eventLoadData()
    func getClassifiedObject(for index: Int) -> ClassifiedData?
}
   

protocol ListViewInteractorOutput: NSObject {
    
    func showError(message: String)
    func reloadContent()

}
