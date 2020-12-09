//
//  HomeInteractor.swift
//  PeakyBlinder
//
//  Created Cuongtv on 12/8/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

/// Home Module Interactor Protocol
protocol HomeInteractorLogic {
    func fetchBrandList()
}

/// Home Module Interactor
class HomeInteractor {
    weak var presenter: HomePresentationLogic!
    weak var router: HomeRoutingLogic!
    private var worker: HomeWorkerLogic
    
    required init(withWorker worker: HomeWorkerLogic) {
        self.worker = worker
    }
}

extension HomeInteractor: HomeInteractorLogic {
    func fetchBrandList() {
        let results = creatSampleData()
        
        presenter.show(brandList: results)
    }
    
    func creatSampleData() -> [BrandEntity] {
        var results: [BrandEntity] = []
        
        results.append(BrandEntity(logo: UIImage(named: "ic_logo_nike"), name: "Nike, Inc.", foundedYear: 1964, founder: "Phil Knight, Bill Bowerman", ceo: "Mark Parker", introduce: "Nike, Inc. là một tập đoàn đa quốc gia của Mỹ hoạt động trong lĩnh vực thiết kế, phát triển, sản xuất, quảng bá cũng như kinh doanh các mặt hàng giày dép, quần áo, phụ kiện, trang thiết bị và dịch vụ liên quan đến thể thao. Trụ sở của công ty được đặt gần Beaverton, Oregon, tại khu vực đô thị Portland."))
        results.append(BrandEntity(logo: UIImage(named: "ic_logo_adidas"), name: "Adidas", foundedYear: 1964, founder: "Phil Knight, Bill Bowerman", ceo: "Mark Parker", introduce: "Nike, Inc. là một tập đoàn đa quốc gia của Mỹ hoạt động trong lĩnh vực thiết kế, phát triển, sản xuất, quảng bá cũng như kinh doanh các mặt hàng giày dép, quần áo, phụ kiện, trang thiết bị và dịch vụ liên quan đến thể thao. Trụ sở của công ty được đặt gần Beaverton, Oregon, tại khu vực đô thị Portland."))
        results.append(BrandEntity(logo: UIImage(named: "ic_logo_vansoffthewall"), name: "Vans", foundedYear: 1964, founder: "Phil Knight, Bill Bowerman", ceo: "Mark Parker", introduce: "Nike, Inc. là một tập đoàn đa quốc gia của Mỹ hoạt động trong lĩnh vực thiết kế, phát triển, sản xuất, quảng bá cũng như kinh doanh các mặt hàng giày dép, quần áo, phụ kiện, trang thiết bị và dịch vụ liên quan đến thể thao. Trụ sở của công ty được đặt gần Beaverton, Oregon, tại khu vực đô thị Portland."))
        
        return results
    }
}

