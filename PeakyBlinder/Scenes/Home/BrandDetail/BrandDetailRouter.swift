//
//  BrandDetailRouter.swift
//  PeakyBlinder
//
//  Created Cuongtv on 12/8/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

protocol BrandDetailRoutingLogic: class {
    func navigateToEdit(brand: BrandEntity)
}

class BrandDetailRouter {
    weak var viewController: BrandDetailViewController!
}

extension BrandDetailRouter: BrandDetailRoutingLogic {
    func navigateToEdit(brand: BrandEntity) {
        let editBrandVC = AddNewBrandConfigurator.viewcontroller()
        editBrandVC.isAddNewBrand = false
        editBrandVC.brandEdit = brand
        editBrandVC.editBrandDelegate = viewController
        viewController.navigationController?.pushViewController(editBrandVC, animated: true)
    }
    
   
    // MARK: Navigation
    /* Example
    func navigateToSomewhere() {
        // NOTE: Teach the router how to navigate to another scene. Some examples follow:
        // 1. Trigger a storyboard segue
        // viewController.performSegueWithIdentifier("ShowSomewhereScene", sender: nil)
        // 2. Present another view controller programmatically
        // viewController.presentViewController(someWhereViewController, animated: true, completion: nil)
        // 3. Ask the navigation controller to push another view controller onto the stack
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
        // 4. Present a view controller from a different storyboard
        // let storyboard = UIStoryboard(name: "OtherThanMain", bundle: nil)
        // let someWhereViewController = storyboard.instantiateInitialViewController() as! SomeWhereViewController
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
    } */
}
