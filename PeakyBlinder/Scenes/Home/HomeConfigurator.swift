//
//  HomeConfigurator.swift
//  PeakyBlinder
//
//  Created Cuongtv on 12/8/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class HomeConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> HomeViewController {
        
        // MARK: Initialise components.
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let interactor = HomeInteractor(withWorker: HomeWorker())
        let router = HomeRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
