//
//  Delivery+CoreDataClass.swift
//  Empilhados
//
//  Created by Hiago Chagas on 22/10/20.
//
//

import Foundation
import CoreData

@objc(Delivery)
public class Delivery: NSManagedObject {
    static func fetchAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext, searchBarArgument: String) -> [Delivery] {
                let request : NSFetchRequest<Delivery> = Delivery.fetchRequest()
                    request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
                if(searchBarArgument != ""){
                    request.predicate = NSPredicate(format: "name CONTAINS '\(searchBarArgument)'")
                }
                guard let Deliveries = try? AppDelegate.viewContext.fetch(request) else {
                    return []
                }
                return Deliveries
            }
            static func deleteAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
                Delivery.fetchAll(viewContext: viewContext, searchBarArgument: "").forEach({ viewContext.delete($0) })
                try? viewContext.save()
            }
}
