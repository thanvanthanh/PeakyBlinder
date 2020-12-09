//
//  AddNewBrandConfigurator.swift
//  PeakyBlinder
//
//  Created Cuongtv on 12/9/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class AddNewBrandConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> AddNewBrandViewController {
        
        // MARK: Initialise components.
        let viewController = AddNewBrandViewController(nibName: "AddNewBrandViewController", bundle: nil)
        let interactor = AddNewBrandInteractor(withWorker: AddNewBrandWorker())
        let router = AddNewBrandRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
