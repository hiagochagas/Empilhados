//
//  AddNewDeliveryVC.swift
//  Empilhados
//
//  Created by Hiago Chagas on 22/10/20.
//

import UIKit

class AddNewDeliveryVC: UIViewController, AddProductToDeliveryDelegate {
    let context = AppDelegate.viewContext
    let deliveryView = AddNewDeliveryView()
    var products: [ProductSold] = []
    var totalPrice: Decimal = 0
    var clientName: String = ""
    weak var delegate: AddProductsSoldToDeliveryDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deliveryView.addNewProductToTableButton.addTarget(self, action: #selector(newProductToTableButtonPressed), for: .touchUpInside)
        deliveryView.saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        deliveryView.productsTableView.delegate = self
        deliveryView.productsTableView.dataSource = self
        deliveryView.clientNameTextField.delegate = self
        deliveryView.totalPriceLabel.text = "Preço total: 0 reais"
        self.view = deliveryView
    }
    
    func addProductToDelivery(product: Product, quantity: Int) {
        let productSold = ProductSold(context: context)
        productSold.name = product.name
        productSold.quantity = Int64(quantity)
        product.addToProductToProductSold(productSold)
        products.append(productSold)
        deliveryView.productsTableView.reloadData()
        totalPrice += Decimal(quantity) * (product.sellPrice as Decimal? ?? 0)
        deliveryView.totalPriceLabel.text = String(describing: "Preço total: \(totalPrice) reais")
    }
    
    @objc func newProductToTableButtonPressed() {
        let tableVC = SelectProductTableVC()
        tableVC.delegate = self
        tableVC.title = "Selecionar Produto"
        self.navigationController?.pushViewController(tableVC, animated: true)
    }

    @objc func saveButtonPressed() {
        delegate?.addProductsSoldToDelivery(products: products, totalPrice: totalPrice, clientName: clientName)
        self.navigationController?.popViewController(animated: true)
    }

}

extension AddNewDeliveryVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectProductCell") as! DeliveryDetailTableViewCell
        cell.productNameLabel.text = product.name
        cell.productQuantityLabel.text = String(describing:product.quantity)
        return cell
    }
    
    
}

extension AddNewDeliveryVC: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        self.clientName = textView.text
    }
    func textViewDidChange(_ textView: UITextView) {
        self.clientName = textView.text
    }
    
}
