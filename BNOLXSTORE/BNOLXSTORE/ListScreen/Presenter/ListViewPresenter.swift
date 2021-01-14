//
//  ListViewPresenter.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import UIKit

class ListViewPresenter: NSObject {

    private weak var userInterface: ListViewPresenterOutput?
    private var router: ListViewRouterInput?
    var interactor: ListViewInteractorInput?
    
    
    // MARK: - Initialize
    
    private override init() {
        super.init()
    }
    
    convenience init(with userInterface: ListViewPresenterOutput?,and transitionHandler: ListViewRouterInput?) {
        self.init()
        self.userInterface = userInterface
        self.router = transitionHandler
    }
    
}


// MARK: - ListViewInteractorOutput

extension ListViewPresenter: ListViewInteractorOutput {
    
    func showError(message: String) {
        self.userInterface?.showLoader(status: false)
        self.userInterface?.showError(message: message)
    }
    
    func reloadContent() {
        self.userInterface?.showLoader(status: false)
        self.userInterface?.reloadContent()
    }
    
}


// MARK: - ListViewPresenterInput

extension ListViewPresenter: ListViewPresenterInput {
    
    var rows: Int { return self.interactor?.rows ?? 0}
    
    func eventLoadData() {
        self.interactor?.eventLoadData()
        self.userInterface?.showLoader(status: true)
    }
    
    func getClassifiedObject(for index: Int) -> ClassifiedData? {
        
        return self.interactor?.getClassifiedObject(for: index)
    }
    
    func showDetailsScreen(data: ClassifiedData) {
        self.router?.showDetailsScreen(data: data)
    }
    
}
