//
//  StorageVC.swift
//  Empilhados
//
//  Created by Hiago Chagas on 20/10/20.
//

import UIKit

class StorageVC: UIViewController, RefreshDataFromTableDelegate, UpdateDataFromProductDelegate {
    let storageView = StorageView()
    let context = AppDelegate.viewContext
    var products: [Product]?
    override func viewDidLoad() {
        super.viewDidLoad()
        storageView.tableView.delegate = self
        storageView.tableView.dataSource = self
        fetchProducts()
        self.navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(addProduct))
        self.view = storageView
    }
    
    func fetchProducts() {
        self.products = Product.fetchAll(viewContext: context)
        storageView.tableView.reloadData()
    }
    
    func updateName(_ indexPath: IndexPath, name: String) {
        let updatedProduct = products![indexPath.row]
        updatedProduct.name = name
        saveContext()
        fetchProducts()
    }
    
    func updateQuantity(_ indexPath: IndexPath, quantity: String) {
        let updatedProduct = products![indexPath.row]
        updatedProduct.quantity = Int64(quantity) ?? 0
        saveContext()
        fetchProducts()
    }
    
    func updateBuyPrice(_ indexPath: IndexPath, buyPrice: String) {
        let updatedProduct = products![indexPath.row]
        updatedProduct.buyPrice = NSDecimalNumber(string: buyPrice)
        saveContext()
        fetchProducts()
    }
    
    func updateSellPrice(_ indexPath: IndexPath, sellPrice: String) {
        let updatedProduct = products![indexPath.row]
        updatedProduct.sellPrice = NSDecimalNumber(string: sellPrice)
        saveContext()
        fetchProducts()
    }
    
    func saveContext() {
        do {
            try self.context.save()
        } catch {
            print("You got the \(error) error when deleting from table view")
        }
    }
    
    @objc func addProduct(){
        let vc = AddProductToStorageVC()
        vc.title = "Adicionar"
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func refreshDataFromTable() {
        fetchProducts()
    }
}

extension StorageVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
            cell.productName.text = product.name
            cell.productQuantity.text = "Quantidade disponível: \(String(product.quantity))"
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let productToRemove = products![indexPath.row]
        if editingStyle == .delete {
            self.context.delete(productToRemove)
            saveContext()
            self.fetchProducts()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products![indexPath.row]
        let vc = EditProductVC()
            vc.delegate = self
            vc.indexPath = indexPath
            vc.title = "Editar Produto"
            vc.editProductView.productNameTextField.text = product.name
            vc.editProductView.productQuantityTextField.text = String(describing: product.quantity)
            vc.editProductView.productBuyPriceTextField.text = String(describing: product.buyPrice ?? 0)
            vc.editProductView.productSellPriceTextField.text = String(describing: product.sellPrice ?? 0)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
