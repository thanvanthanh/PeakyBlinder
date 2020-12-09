//
//  BrandDetailConfigurator.swift
//  PeakyBlinder
//
//  Created Cuongtv on 12/8/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class BrandDetailConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> BrandDetailViewController {
        
        // MARK: Initialise components.
        let viewController = BrandDetailViewController(nibName: "BrandDetailViewController", bundle: nil)
        let interactor = BrandDetailInteractor(withWorker: BrandDetailWorker())
        let router = BrandDetailRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
