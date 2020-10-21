//
//  EditProductVC.swift
//  Empilhados
//
//  Created by Hiago Chagas on 21/10/20.
//

import UIKit


class EditProductVC: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    let editProductView = EditProductView()
    var indexPath: IndexPath? = nil
    weak var delegate: UpdateDataFromProductDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editProductView.productBuyPriceTextField.delegate = self
        editProductView.productNameTextField.delegate = self
        editProductView.productQuantityTextField.delegate = self
        editProductView.productSellPriceTextField.delegate = self
        editProductView.productImageButton.addTarget(self, action: #selector(cameraButtonPressed), for: .touchUpInside)
        self.view = editProductView
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
            editProductView.productImage.image = userPickedImage
            delegate?.updateImage(indexPath!, image: userPickedImage)
            picker.dismiss(animated: true)
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
