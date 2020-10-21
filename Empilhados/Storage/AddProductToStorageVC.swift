//
//  AddProductToStorageVC.swift
//  Empilhados
//
//  Created by Hiago Chagas on 20/10/20.
//

import UIKit

class AddProductToStorageVC: UIViewController {
    let context = AppDelegate.viewContext
    let addProductView = AddProductToStorageView()
    weak var delegate: RefreshDataFromTableDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        addProductView.saveButton.addTarget(self, action: #selector(clickedOnSave), for: .touchUpInside)
        self.view = addProductView
    }
    
    @objc func clickedOnSave(){
        let newProduct = Product(context: context)
        newProduct.name = addProductView.productNameTextField.text
        let newProductQuantity = Int(addProductView.productQuantityTextField.text)
        newProduct.quantity = Int64(newProductQuantity ?? 0)
        newProduct.buyPrice = NSDecimalNumber(string: addProductView.productBuyPriceTextField.text)
        newProduct.sellPrice = NSDecimalNumber(string: addProductView.productSellPriceTextField.text)
        do{
            try self.context.save()
        } catch {
            print("Error \(error) when saving the data")
        }
        delegate?.refreshDataFromTable()
        self.navigationController?.popViewController(animated: true)
    }

    

}
