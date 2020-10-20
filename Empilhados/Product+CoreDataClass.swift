//
//  Product+CoreDataClass.swift
//  Empilhados
//
//  Created by Hiago Chagas on 20/10/20.
//
//

import Foundation
import CoreData

@objc(Product)
public class Product: NSManagedObject {
    static func fetchAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) -> [Product] {
            let request : NSFetchRequest<Product> = Product.fetchRequest()
                request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            guard let Products = try? AppDelegate.viewContext.fetch(request) else {
                return []
            }
            return Products
        }
        static func deleteAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
            Product.fetchAll(viewContext: viewContext).forEach({ viewContext.delete($0) })
            try? viewContext.save()
        }

}
