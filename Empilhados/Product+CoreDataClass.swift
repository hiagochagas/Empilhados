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
    static func fetchAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext, searchBarArgument: String) -> [Product] {
            let request : NSFetchRequest<Product> = Product.fetchRequest()
                request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            if(searchBarArgument != ""){
                request.predicate = NSPredicate(format: "name CONTAINS '\(searchBarArgument)'")
            }
            guard let Products = try? AppDelegate.viewContext.fetch(request) else {
                return []
            }
            return Products
        }
        static func deleteAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
            Product.fetchAll(viewContext: viewContext, searchBarArgument: "").forEach({ viewContext.delete($0) })
            try? viewContext.save()
        }

}
