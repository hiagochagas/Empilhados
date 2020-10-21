//
//  AddProductToStorageVC.swift
//  Empilhados
//
//  Created by Hiago Chagas on 20/10/20.
//

import UIKit

class AddProductToStorageVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let context = AppDelegate.viewContext
    let addProductView = AddProductToStorageView()
    weak var delegate: RefreshDataFromTableDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        addProductView.saveButton.addTarget(self, action: #selector(clickedOnSave), for: .touchUpInside)
        addProductView.productImageButton.addTarget(self, action: #selector(cameraButtonPressed), for: .touchUpInside)
        self.view = addProductView
    }
    
    @objc func clickedOnSave(){
        let newProduct = Product(context: context)
            newProduct.name = addProductView.productNameTextField.text
        let newProductQuantity = Int(addProductView.productQuantityTextField.text)
            newProduct.quantity = Int64(newProductQuantity ?? 0)
            newProduct.buyPrice = NSDecimalNumber(string: addProductView.productBuyPriceTextField.text)
            newProduct.sellPrice = NSDecimalNumber(string: addProductView.productSellPriceTextField.text)
            newProduct.image = addProductView.productImage.image!.pngData()
        do{
            try self.context.save()
        } catch {
            print("Error \(error) when saving the data")
        }
        delegate?.refreshDataFromTable()
        self.navigationController?.popViewController(animated: true)
    }

    @objc func cameraButtonPressed(){
        let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else { return }
            addProductView.productImage.image = userPickedImage
            picker.dismiss(animated: true)
    }
    

}
