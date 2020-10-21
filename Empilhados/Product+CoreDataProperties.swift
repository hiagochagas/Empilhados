//
//  Product+CoreDataProperties.swift
//  Empilhados
//
//  Created by Hiago Chagas on 21/10/20.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var buyPrice: NSDecimalNumber?
    @NSManaged public var name: String?
    @NSManaged public var quantity: Int64
    @NSManaged public var sellPrice: NSDecimalNumber?
    @NSManaged public var image: Data?

}

extension Product : Identifiable {

}
