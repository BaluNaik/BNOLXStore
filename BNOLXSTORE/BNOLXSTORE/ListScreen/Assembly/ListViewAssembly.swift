//
//  ListViewAssembly.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import UIKit

final class ListViewAssembly: NSObject {
    
    // MARK: - Public
    
    func assemblyModule() -> UIViewController? {
        
        return self.viewModule()
    }
    
}

// MARK: - Private

private extension ListViewAssembly {
    
    func viewModule() -> ListViewController? {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListVC") as? ListViewController
        viewController?.presenter = self.presenterModule(with: viewController)
        
        return viewController
    }
    
    func presenterModule(with viewController: ListViewController?) -> ListViewPresenter? {
        let router = routerModule(with: viewController)
        let presenter = ListViewPresenter(with: viewController, and: router)
        presenter.interactor = interactorModule(with: presenter)
        
        return presenter
    }
    
    func interactorModule(with presenter: ListViewInteractorOutput?) -> ListViewInteractor? {
        let interactor = ListViewInteractor()
        interactor.presenter = presenter
        interactor.getAddsList()
        return interactor
    }
    
    func routerModule(with transitionHandler: ListViewController?) -> ListViewRouter? {
        let router = ListViewRouter(with: transitionHandler)
        
        return router
    }
    
}
