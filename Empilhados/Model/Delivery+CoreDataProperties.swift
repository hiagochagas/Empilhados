//
//  Delivery+CoreDataProperties.swift
//  Empilhados
//
//  Created by Hiago Chagas on 22/10/20.
//
//

import Foundation
import CoreData


extension Delivery {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Delivery> {
        return NSFetchRequest<Delivery>(entityName: "Delivery")
    }

    @NSManaged public var clientName: String?
    @NSManaged public var totalPrice: NSDecimalNumber?
    @NSManaged public var date: Date?
    @NSManaged public var deliveryToProductSold: NSSet?

}

// MARK: Generated accessors for deliveryToProductSold
extension Delivery {

    @objc(addDeliveryToProductSoldObject:)
    @NSManaged public func addToDeliveryToProductSold(_ value: ProductSold)

    @objc(removeDeliveryToProductSoldObject:)
    @NSManaged public func removeFromDeliveryToProductSold(_ value: ProductSold)

    @objc(addDeliveryToProductSold:)
    @NSManaged public func addToDeliveryToProductSold(_ values: NSSet)

    @objc(removeDeliveryToProductSold:)
    @NSManaged public func removeFromDeliveryToProductSold(_ values: NSSet)

}

extension Delivery : Identifiable {

}
