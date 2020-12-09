//
//  AddNewBrandViewController.swift
//  PeakyBlinder
//
//  Created Cuongtv on 12/9/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol AddNewBrandPresentationLogic: class {
    
}

// MARK: View
class AddNewBrandViewController: UIViewController {
    var interactor: AddNewBrandInteractorLogic!
    var router: AddNewBrandRoutingLogic!
    var addNewBrandDelegate: AddNewBrandDelegate!
    var editBrandDelegate: EditBrandDelegate!

    // MARK: IBOutlet
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var foundedYearTf: UITextField!
    @IBOutlet weak var founderTf: UITextField!
    @IBOutlet weak var ceoTf: UITextField!
    @IBOutlet weak var introduceTv: UITextView!
    
    var isAddNewBrand = true
    var brandEdit: BrandEntity?
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fillDataToEdit()
    }
    
    // MARK: Fetch AddNewBrand
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        title = isAddNewBrand ? "Add new brand" : "Edit brand"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(ontapSave))
    }
    
    private func fillDataToEdit(){
        if !isAddNewBrand && brandEdit != nil{
            logoImg.image = brandEdit?.logo
            nameTf.text = brandEdit?.name
            foundedYearTf.text = "\(brandEdit?.foundedYear ?? 2000)"
            founderTf.text = brandEdit?.founder
            ceoTf.text = brandEdit?.ceo
            introduceTv.text = brandEdit?.introduce
        }
    }
    
    // MARK: IBAction
    @IBAction func ontapAddPhotoLogo(_ sender: Any) {
        openGallery()
    }
    
    @objc func ontapSave() {
        if validateNewBrand() {
            let logo = logoImg.image
            let name = nameTf.text
            let foundedYear = Int(foundedYearTf.text ?? "2000")
            let founder = founderTf.text
            let ceo = ceoTf.text
            let introduce = introduceTv.text
            
            let newBrand: BrandEntity = BrandEntity(logo: logo, name: name, foundedYear: foundedYear, founder: founder, ceo: ceo, introduce: introduce)
                        
            if isAddNewBrand {
                interactor.newBrandValidated(newBrand: newBrand) //Theo đúng luồng thì qua interactor
//                router.passNewBrandBack(newBrand: newBrand) //Nhưng nếu không cần xử lý logic thì có thể bắn thẳng qua router

            }else{
                interactor.newBrandEdited(newBrand: newBrand)
//                router.editedBrand(newBrand: newBrand)
            }
        }
    }
    
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validateNewBrand() -> Bool {
        if nameTf.text?.count == 0 || foundedYearTf.text?.count == 0 || founderTf.text?.count == 0 || ceoTf.text?.count == 0 || introduceTv.text.count == 0{
            print("Please input all information")
            return false
        }
        return true
    }
}

// MARK: Connect View, Interactor, and Presenter
extension AddNewBrandViewController: AddNewBrandPresentationLogic {
    
}

// MARK: Photo Picker Delegate
extension AddNewBrandViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            self.logoImg.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
