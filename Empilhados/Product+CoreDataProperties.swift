//
//  Product+CoreDataProperties.swift
//  Empilhados
//
//  Created by Hiago Chagas on 20/10/20.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: Int64
    @NSManaged public var sellPrice: NSDecimalNumber?
    @NSManaged public var buyPrice: NSDecimalNumber?

}

extension Product : Identifiable {

}
