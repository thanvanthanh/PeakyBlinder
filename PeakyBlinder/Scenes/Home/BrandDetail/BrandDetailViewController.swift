//
//  BrandDetailViewController.swift
//  PeakyBlinder
//
//  Created Cuongtv on 12/8/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol BrandDetailPresentationLogic: class {
    
}

protocol EditBrandDelegate {
    func brandEdited(brandEditted: BrandEntity)
}

// MARK: View
class BrandDetailViewController: UIViewController {
    var interactor: BrandDetailInteractorLogic!
    var router: BrandDetailRoutingLogic!
    var updateEditedBrandDelegate: UpdateBrandFromDetailDelegate!
    
    // MARK: IBOutlet
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var foundedYearLbl: UILabel!
    @IBOutlet weak var founderLbl: UILabel!
    @IBOutlet weak var ceoLbl: UILabel!
    @IBOutlet weak var introduceLbl: UILabel!
    
    var brand: BrandEntity?
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fillData()
    }
    
    // MARK: Fetch BrandDetail
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        title = "Detail"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(ontapEdit))

    }
    
    func fillData() {
        if (brand != nil) {
            self.logoImg.image = brand?.logo
            self.nameLbl.text = brand?.name
            self.foundedYearLbl.text = "\(brand?.foundedYear ?? 2000)"
            self.founderLbl.text = brand?.founder
            self.ceoLbl.text = brand?.ceo
            self.introduceLbl.text = brand?.introduce
        }
    }
    
    // MARK: IBAction
    
    @objc func ontapEdit() {
        if let brandToEdit = brand {
            router.navigateToEdit(brand: brandToEdit)
        }
    }
}

// MARK: Connect View, Interactor, and Presenter
extension BrandDetailViewController: BrandDetailPresentationLogic {
    
}

// Mark: Delegate passdata

extension BrandDetailViewController: EditBrandDelegate{
    func brandEdited(brandEditted: BrandEntity) {
        brand = brandEditted
        updateEditedBrandDelegate.updateBrandFromDetail(brandEdited: brandEditted)
    }
}
