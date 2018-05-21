//
//  WalletsService.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/3/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class WalletsService {
    
    static func initializeWallets(context: NSManagedObjectContext? = nil) -> Wallets? {
        // need to check number of wallets
        if let walletsCount = try? CoreDataService.countObjects(Wallets.self, context: context) {
            if walletsCount > 0 {
                return nil
            } else {
                // create new wallet
                let walletModel = WalletModel(id: nil, name: Constants.Wallet.defaultWalletName, currency: nil, categories: nil)
                return createWallet(walletModel, context: context)
            }
        }
        return nil
    }
    
    static func fetchAllWallets(context: NSManagedObjectContext? = nil) -> [WalletModel] {
        var wallets = [WalletModel]()
        if let objects = try? CoreDataService.fetchObjects(Wallets.self, context: context) {
            for object in objects {
                wallets.append(createModelClassFrom(object: object))
            }
        }
        return wallets
    }

    static func checkWalletNameUnic(walletName: String, context: NSManagedObjectContext? = nil) -> Bool {
        var answer = false
        
        let targetContext = context ?? CoreDataService.viewContext()
        
        // need to check wallet name unic
        let predicate = NSPredicate(format: "name == %@", walletName)
        if let objects = try? CoreDataService.countObjects(Wallets.self, predicate: predicate, context: targetContext) {
            answer = objects > 0 ? false : true
        }
        return answer
    }
    
//    static func existAtLeastOneWallet() -> Bool {
//        var answer = false
//        if let objects = try? CoreDataService.fetchObjects(Wallets.self) {
//            answer = objects.isEmpty ? false : true
//        }
//        return answer
//    }

    static func fetchWallet(_ wallet: WalletModel, context: NSManagedObjectContext? = nil) -> WalletModel? {
        if let walletId = wallet.id as? NSManagedObjectID {
            let targetContext = context ?? CoreDataService.viewContext()
            if let wallet = CoreDataService.fetchObject(Wallets.self, withId: walletId, context: targetContext) {
                return createModelClassFrom(object: wallet)
            }
        }
        return wallet
    }

    static func createWallet(_ walletModel: WalletModel, context: NSManagedObjectContext? = nil) -> Wallets {
        let targetContext = context ?? CoreDataService.viewContext()
        
        var newWallet = Wallets(context: targetContext)
        
        // need to check wallet name unic
        let predicate = NSPredicate(format: "name == %@", walletModel.name)
        if let objects = try? CoreDataService.fetchObjects(Wallets.self, sortBy: nil, predicate: predicate, context: targetContext) {
            if objects.count > 0 {
                newWallet = objects.first!
            }
        }
        
        // fill new wallet properties
        newWallet.name = walletModel.name
        
        // need to fetch currency
        if let currencyModel = walletModel.currency {
            let currency = CurrencyService.objectClassFromModel(currencyModel, context: targetContext)
            newWallet.currency = currency
        }
        
        // need to fetch categories
        if let categoriesArray = walletModel.categories {
            for currentCategory in categoriesArray {
                if let categoryObject = CategoryService.objectClassFromModel(currentCategory, context: targetContext) {
                    newWallet.addToCategories(categoryObject)
                }
            }
        }
        
        return newWallet
    }

    // MARK: private
    
    private static func fillNewWallet() {
        
    }
    
    // MARK: convert

    static func createModelClassFrom(object: Wallets) -> WalletModel {
        var walletModel = WalletModel(id: object.objectID, name: object.name, currency: nil, categories: nil)
        if let currency = object.currency {
            walletModel.currency = CurrencyService.createModelClassFrom(object: currency)
        }
        if let categories = object.categories {
            var categoriesModel = [CategoryModel]()
            for category in categories {
                if let categoryEntity = category as? Categories {
                    let categoryModel = CategoryService.createModelClassFrom(object: categoryEntity)
                    categoriesModel.append(categoryModel)
                }
            }
            walletModel.categories = categoriesModel
        }
        return walletModel
    }
}
