//
//  BrandDetailInteractor.swift
//  PeakyBlinder
//
//  Created Cuongtv on 12/8/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// BrandDetail Module Interactor Protocol
protocol BrandDetailInteractorLogic {
    
}

/// BrandDetail Module Interactor
class BrandDetailInteractor {
    weak var presenter: BrandDetailPresentationLogic!
    weak var router: BrandDetailRoutingLogic!
    private var worker: BrandDetailWorkerLogic
    
    required init(withWorker worker: BrandDetailWorkerLogic) {
        self.worker = worker
    }
}

extension BrandDetailInteractor: BrandDetailInteractorLogic {

}

