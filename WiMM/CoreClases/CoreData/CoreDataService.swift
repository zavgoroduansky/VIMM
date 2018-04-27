//
//  CoreDataService.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/6/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataService {
    
    static func viewContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
    // MARK: - Core Data Saving support
    
    static func saveContext(_ context: NSManagedObjectContext? = nil) {
        let targetContext = context ?? viewContext()
        if targetContext.hasChanges {
            do {
                try targetContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Core Data Fetching support
    
    static func fetchObjects <T: NSManagedObject>(_ entityClass:T.Type,
                                           sortBy: [NSSortDescriptor]? = nil,
                                           predicate: NSPredicate? = nil,
                                           context: NSManagedObjectContext? = nil) throws -> [T] {
        
        let targetContext = context ?? viewContext()
        let request: NSFetchRequest<T>
        if #available(iOS 10.0, *) {
            request = entityClass.fetchRequest() as! NSFetchRequest<T>
        } else {
            let entityName = String(describing: entityClass)
            request = NSFetchRequest(entityName: entityName)
        }
        
        request.returnsObjectsAsFaults = false
        request.predicate = predicate
        request.sortDescriptors = sortBy
        
        let fetchedResult = try targetContext.fetch(request)
        return fetchedResult
    }
    
    static func countObjects <T: NSManagedObject>(_ entityClass:T.Type,
                                                  predicate: NSPredicate? = nil,
                                                  context: NSManagedObjectContext? = nil) throws -> Int {
        
        let targetContext = context ?? viewContext()
        let request: NSFetchRequest<T>
        if #available(iOS 10.0, *) {
            request = entityClass.fetchRequest() as! NSFetchRequest<T>
        } else {
            let entityName = String(describing: entityClass)
            request = NSFetchRequest(entityName: entityName)
        }
        
        request.returnsObjectsAsFaults = false
        request.predicate = predicate
        
        let fetchedResult = try targetContext.count(for: request)
        return fetchedResult
    }
    
    static func fetchObject <T: NSManagedObject>(_ entityClass:T.Type,
                                                 withId objectId: NSManagedObjectID,
                                                 context: NSManagedObjectContext? = nil) -> T? {
        let targetContext = context ?? viewContext()
        if let fetchedResult = try? targetContext.existingObject(with: objectId) {
            return fetchedResult as? T
        } else {
            return nil
        }
    }
}
