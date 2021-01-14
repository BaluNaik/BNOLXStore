//
//  ListViewRouter.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import UIKit

class ListViewRouter: NSObject, ListViewRouterInput {
    
    private var transitionHandler: UIViewController?
    
    
    // MARK: - Initialize
    
    private override init() {
        super.init()
    }
    
    convenience init(with handler: UIViewController?) {
        self.init()
        self.transitionHandler = handler
    }
    
    
    // MARK: - ListViewRouterInput
    
    func showDetailsScreen(data: ClassifiedData) {
        if let detailsVc = DetailsAssembly(data)?.viewModule() {
            self.transitionHandler?.navigationController?.pushViewController(detailsVc, animated: true)
        }
    }

}
