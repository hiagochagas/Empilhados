//
//  Product+CoreDataProperties.swift
//  Empilhados
//
//  Created by Hiago Chagas on 22/10/20.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var buyPrice: NSDecimalNumber?
    @NSManaged public var image: Data?
    @NSManaged public var name: String?
    @NSManaged public var quantity: Int64
    @NSManaged public var sellPrice: NSDecimalNumber?
    @NSManaged public var productToProductSold: NSSet?

}

// MARK: Generated accessors for productToProductSold
extension Product {

    @objc(addProductToProductSoldObject:)
    @NSManaged public func addToProductToProductSold(_ value: ProductSold)

    @objc(removeProductToProductSoldObject:)
    @NSManaged public func removeFromProductToProductSold(_ value: ProductSold)

    @objc(addProductToProductSold:)
    @NSManaged public func addToProductToProductSold(_ values: NSSet)

    @objc(removeProductToProductSold:)
    @NSManaged public func removeFromProductToProductSold(_ values: NSSet)

}

extension Product : Identifiable {

}
