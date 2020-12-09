//
//  AddNewBrandRouter.swift
//  PeakyBlinder
//
//  Created Cuongtv on 12/9/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

protocol AddNewBrandRoutingLogic: class {
    func passNewBrandBack(newBrand: BrandEntity)
    func editedBrand(newBrand: BrandEntity)
}

class AddNewBrandRouter {
    weak var viewController: AddNewBrandViewController!
}

extension AddNewBrandRouter: AddNewBrandRoutingLogic {
    func editedBrand(newBrand: BrandEntity) {
        viewController.editBrandDelegate.brandEdited(brandEditted: newBrand)
        viewController.navigationController?.popViewController(animated: true)
    }
    
    func passNewBrandBack(newBrand: BrandEntity) {
        viewController.addNewBrandDelegate.receiveNewBrand(newBrand: newBrand)
        viewController.navigationController?.popViewController(animated: true)
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
