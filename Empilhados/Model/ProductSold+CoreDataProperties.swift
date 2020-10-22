//
//  ProductSold+CoreDataProperties.swift
//  Empilhados
//
//  Created by Hiago Chagas on 22/10/20.
//
//

import Foundation
import CoreData


extension ProductSold {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductSold> {
        return NSFetchRequest<ProductSold>(entityName: "ProductSold")
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: Int64
    @NSManaged public var productSoldToProduct: Product?
    @NSManaged public var productSoldToDelivery: Delivery?

}

extension ProductSold : Identifiable {

}
