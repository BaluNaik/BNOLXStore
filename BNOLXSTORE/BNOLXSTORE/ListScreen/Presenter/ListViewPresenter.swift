//
//  ListViewPresenter.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import UIKit

class ListViewPresenter: NSObject, ListViewPresenterInput, ListViewInteractorOutput {

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
