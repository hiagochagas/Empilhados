//
//  DeliveryViewController.swift
//  Empilhados
//
//  Created by Hiago Chagas on 20/10/20.
//

import UIKit

class DeliveryVC: UIViewController, AddProductsSoldToDeliveryDelegate {
    let context = AppDelegate.viewContext
    let deliveryView = DeliveryView()
    var deliveries: [Delivery]?
    weak var delegate: RefreshDataFromTableDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(addDelivery))
        deliveryView.tableView.delegate = self
        deliveryView.tableView.dataSource = self
        fetchDeliveries()
        self.view = deliveryView
        
    }
    func addProductsSoldToDelivery(products: [ProductSold], totalPrice: Decimal, clientName: String) {
        let delivery = Delivery(context: context)
        for product in products{
            delivery.addToDeliveryToProductSold(product)
            product.productSoldToProduct?.quantity -= product.quantity
            self.delegate?.refreshDataFromTable()
        }
        delivery.date = Date()
        delivery.totalPrice = NSDecimalNumber(decimal: totalPrice)
        delivery.clientName = clientName
        saveContext()
        fetchDeliveries()
    }
    func saveContext() {
        do {
            try self.context.save()
        } catch {
            print("You got the \(error) error when deleting from table view")
        }
    }
    func fetchDeliveries(){
        self.deliveries = Delivery.fetchAll(viewContext: context, searchBarArgument: "")
        deliveryView.tableView.reloadData()
    }
    
    @objc func addDelivery() {
        let vc = AddNewDeliveryVC()
        vc.title = "Nova Entrega"
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
extension DeliveryVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deliveries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let delivery = deliveries![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "deliveryCell") as! DeliveryTableViewCell
        cell.clientNameLabel.text = "Pedido de \(String(describing: delivery.clientName!))"
        cell.priceLabel.text = "Preço total: \(String(describing: delivery.totalPrice!)) reais"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let deliveryToRemove = deliveries![indexPath.row]
        if editingStyle == .delete {
            self.context.delete(deliveryToRemove)
            saveContext()
            fetchDeliveries()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let delivery = deliveries![indexPath.row]
        let tableVC = DeliveryDetailsTableVC()
        let products = delivery.deliveryToProductSold!.allObjects
        var unwrappedProducts: [ProductSold] = []
        for product in products {
            unwrappedProducts.append(product as! ProductSold)
        }
        tableVC.products = unwrappedProducts
        tableVC.title = "Pedido de \(delivery.clientName!)"
        self.navigationController?.pushViewController(tableVC, animated: true)
    }
    
}
