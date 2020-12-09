//
//  AddNewBrandInteractor.swift
//  PeakyBlinder
//
//  Created Cuongtv on 12/9/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// AddNewBrand Module Interactor Protocol
protocol AddNewBrandInteractorLogic {
    func newBrandValidated(newBrand: BrandEntity)
    func newBrandEdited(newBrand: BrandEntity)
}

/// AddNewBrand Module Interactor
class AddNewBrandInteractor {
    weak var presenter: AddNewBrandPresentationLogic!
    weak var router: AddNewBrandRoutingLogic!
    private var worker: AddNewBrandWorkerLogic
    
    required init(withWorker worker: AddNewBrandWorkerLogic) {
        self.worker = worker
    }
}

extension AddNewBrandInteractor: AddNewBrandInteractorLogic {
    func newBrandEdited(newBrand: BrandEntity) {
        router.editedBrand(newBrand: newBrand)
    }
    
    func newBrandValidated(newBrand: BrandEntity) {
        
        router.passNewBrandBack(newBrand: newBrand)
    }
}

