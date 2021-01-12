//
//  ViewController.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/12/21.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if let listVC = ListViewAssembly().assemblyModule() {
                let navigationVC = UINavigationController(rootViewController: listVC)
                navigationVC.modalPresentationStyle = .fullScreen
                self.present(navigationVC, animated: false, completion: nil)
            }
        }
        
    }


}

