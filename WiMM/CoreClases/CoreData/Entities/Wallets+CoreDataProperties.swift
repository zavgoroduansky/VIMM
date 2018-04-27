//
//  Wallets+CoreDataProperties.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/6/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//
//

import Foundation
import CoreData


extension Wallets {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wallets> {
        return NSFetchRequest<Wallets>(entityName: "Wallets")
    }

    @NSManaged public var name: String
    @NSManaged public var currency: Currencies?
    @NSManaged public var categories: NSSet?

}

// MARK: Generated accessors for categories
extension Wallets {

    @objc(addCategoriesObject:)
    @NSManaged public func addToCategories(_ value: Categories)

    @objc(removeCategoriesObject:)
    @NSManaged public func removeFromCategories(_ value: Categories)

    @objc(addCategories:)
    @NSManaged public func addToCategories(_ values: NSSet)

    @objc(removeCategories:)
    @NSManaged public func removeFromCategories(_ values: NSSet)

}
