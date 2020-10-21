//
//  EditProductVC.swift
//  Empilhados
//
//  Created by Hiago Chagas on 21/10/20.
//

import UIKit


class EditProductVC: UIViewController, UITextViewDelegate {
    let editProductView = EditProductView()
    var indexPath: IndexPath? = nil
    weak var delegate: UpdateDataFromProductDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editProductView.productBuyPriceTextField.delegate = self
        editProductView.productNameTextField.delegate = self
        editProductView.productQuantityTextField.delegate = self
        editProductView.productSellPriceTextField.delegate = self
        self.view = editProductView
    }

}

extension EditProductVC{
    func textViewDidEndEditing(_ textView: UITextView) {
        switch textView.tag {
        case 0:
            delegate?.updateName(indexPath!, name: textView.text)
        case 1:
            delegate?.updateQuantity(indexPath!, quantity: textView.text)
        case 2:
            delegate?.updateBuyPrice(indexPath!, buyPrice: textView.text)
        case 3:
            delegate?.updateSellPrice(indexPath!, sellPrice: textView.text)
        default:
            return
        }
    }
}
