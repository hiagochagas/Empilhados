//
//  SelectProductTableVC.swift
//  Empilhados
//
//  Created by Hiago Chagas on 22/10/20.
//

import UIKit

class SelectProductTableVC: UITableViewController {
    let context = AppDelegate.viewContext
    var products: [Product]?
    weak var delegate: AddProductToDeliveryDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "productCellForSelection")
        tableView.separatorStyle = .none
        
        fetchProducts()
    }
    func fetchProducts(_ searchBarArgument: String = "") {
        self.products = Product.fetchAll(viewContext: context, searchBarArgument: searchBarArgument)
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCellForSelection", for: indexPath) as! ProductTableViewCell
            cell.productName.text = product.name
            cell.productQuantity.text = "Quantidade disponível: \(String(product.quantity))"
            cell.productImage.image = UIImage(data: product.image!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products![indexPath.row]
        var quantity: Int = 0
        let alert = UIAlertController(title: "Selecionar Produto", message: "Quantos produtos esse cliente deseja?", preferredStyle: .alert)
        alert.addTextField(configurationHandler: {
                        (textField) -> Void in
                    })
                    alert.addAction(UIAlertAction(title: "Salvar", style: .default, handler: {
                        (action) -> Void in
                        //does stuff on click on save
                        let quantityFromTextField = alert.textFields![0] as UITextField
                        quantity = Int(quantityFromTextField.text ?? "0") ?? 0
                        if quantity <= product.quantity {
                            self.delegate?.addProductToDelivery(product: product, quantity: quantity)
                            self.navigationController?.popViewController(animated: true)
                        } else {
                            //speaks something inside the alert
                        }
                    }))
                    present(alert, animated: true, completion: nil)
    }

}
