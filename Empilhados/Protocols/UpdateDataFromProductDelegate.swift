//
//  UpdateDataFromProductDelegate.swift
//  Empilhados
//
//  Created by Hiago Chagas on 21/10/20.
//

import Foundation

protocol UpdateDataFromProductDelegate: class{
    func updateName(_ indexPath: IndexPath, name: String)
    func updateQuantity(_ indexPath: IndexPath, quantity: String)
    func updateBuyPrice(_ indexPath: IndexPath, buyPrice: String)
    func updateSellPrice(_ indexPath: IndexPath, sellPrice: String)
}
