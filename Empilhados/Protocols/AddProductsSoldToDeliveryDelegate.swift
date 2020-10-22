//
//  AddProductsSoldToDeliveryDelegate.swift
//  Empilhados
//
//  Created by Hiago Chagas on 22/10/20.
//

import Foundation

protocol AddProductsSoldToDeliveryDelegate: class{
    func addProductsSoldToDelivery(products: [ProductSold], totalPrice: Decimal, clientName: String)
}
