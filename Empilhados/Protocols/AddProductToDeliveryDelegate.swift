//
//  AddProductToDeliveryDelegate.swift
//  Empilhados
//
//  Created by Hiago Chagas on 22/10/20.
//

import Foundation

protocol AddProductToDeliveryDelegate: class {
    func addProductToDelivery(product: Product, quantity: Int)
}

