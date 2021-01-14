//
//  ListViewInteractor.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import UIKit

class ListViewInteractor: NSObject, ListViewInteractorInput {
    
    var rows: Int { return classified?.results?.count ?? 0}
    
    private var classified: Classified?
    weak var presenter: ListViewInteractorOutput?
    var networkManager = NetworkingManager()
    
    func eventLoadData() {
        networkManager.request(ListApi.getlist) {[weak self] (data, errorMesg) in
            if let errorText = errorMesg {
                DispatchQueue.main.async {
                    self?.presenter?.showError(message: errorText)
                }
                return
            }
            self?.classified = CodableParser.parseResponse(data, type: Classified.self)
            DispatchQueue.main.async {
                self?.presenter?.reloadContent()
            }
        }
    }
    
    func getClassifiedObject(for index: Int) -> ClassifiedData? {
        
        return self.classified?.results?[index]
    }

}
