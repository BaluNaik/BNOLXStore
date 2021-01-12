//
//  ListViewInteractor.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import UIKit

class ListViewInteractor: NSObject, ListViewInteractorInput {
    
    weak var presenter: ListViewInteractorOutput?
    var networkManager = NetworkingManager()
    
    func getAddsList() {
        networkManager.request(ListApi.getlist) { (data, errorMesg) in
            print("\(data),\(errorMesg)")
        }
    }

}
