//
//  Currencies+CoreDataProperties.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/6/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//
//

import Foundation
import CoreData


extension Currencies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Currencies> {
        return NSFetchRequest<Currencies>(entityName: "Currencies")
    }

    @NSManaged public var code: Int16
    @NSManaged public var name: String
    @NSManaged public var shortName: String
    @NSManaged public var wallets: NSSet?

}

// MARK: Generated accessors for wallets
extension Currencies {

    @objc(addWalletsObject:)
    @NSManaged public func addToWallets(_ value: Wallets)

    @objc(removeWalletsObject:)
    @NSManaged public func removeFromWallets(_ value: Wallets)

    @objc(addWallets:)
    @NSManaged public func addToWallets(_ values: NSSet)

    @objc(removeWallets:)
    @NSManaged public func removeFromWallets(_ values: NSSet)

}
