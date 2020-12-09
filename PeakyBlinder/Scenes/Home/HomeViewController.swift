//
//  HomeViewController.swift
//  PeakyBlinder
//
//  Created Cuongtv on 12/8/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol HomePresentationLogic: class {
    func show(brandList: [BrandEntity])
}

protocol AddNewBrandDelegate {
    func receiveNewBrand(newBrand: BrandEntity)
}

protocol UpdateBrandFromDetailDelegate {
    func updateBrandFromDetail(brandEdited: BrandEntity)
}

// MARK: View
class HomeViewController: UIViewController {
    var interactor: HomeInteractorLogic!
    var router: HomeRoutingLogic!
    
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    var indexSelected: Int!
    
    var brands: [BrandEntity] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    // MARK: Fetch Home
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        interactor.fetchBrandList()
    }
    
    // MARK: SetupUI
    private func setupView() {
        title = "Peaky Blinder"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BrandTableViewCell", bundle: nil), forCellReuseIdentifier: "BrandTableViewCell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

    }
    
    // MARK: IBAction
    
    @objc func addTapped() {
        router.navigateToAddNewBrand()
    }
}

// MARK: Connect View, Interactor, and Presenter
extension HomeViewController: HomePresentationLogic {
    func show(brandList: [BrandEntity]) {
        brands = brandList
    }
}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BrandTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BrandTableViewCell", for: indexPath) as! BrandTableViewCell
        let brand = brands[indexPath.row]
        cell.updateData(brand: brand)
        
        return cell
     }
    
    
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let brand = brands[indexPath.row]
        indexSelected = indexPath.row
        router.navigateToDetail(brand)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            brands.remove(at: indexPath.row)
        }
    }
}

    // Mark: Delegate passdata

extension HomeViewController: AddNewBrandDelegate{
    func receiveNewBrand(newBrand: BrandEntity) {
        brands.append(newBrand)
    }
}

extension HomeViewController: UpdateBrandFromDetailDelegate{
    func updateBrandFromDetail(brandEdited: BrandEntity) {
        brands[indexSelected] = brandEdited
    }
}
