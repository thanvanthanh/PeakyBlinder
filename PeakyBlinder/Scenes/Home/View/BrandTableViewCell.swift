//
//  BrandTableViewCell.swift
//  PeakyBlinder
//
//  Created by Cuongtv on 12/8/20.
//

import UIKit

class BrandTableViewCell: UITableViewCell {
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var foundedYearLbl: UILabel!
    @IBOutlet weak var founderLbl: UILabel!
    @IBOutlet weak var ceoLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateData(brand: BrandEntity) {
        logoImage.image = brand.logo
        nameLbl.text = brand.name
        foundedYearLbl.text = "\(brand.foundedYear ?? 2000)"
        founderLbl.text = brand.founder
        ceoLbl.text = brand.ceo
    }
    
}
