//
//  CategoryService.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/5/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CategoryService {
    
    static func initializeCategories(for wallet: Wallets, context: NSManagedObjectContext? = nil) -> Categories? {
        let targetContext = context ?? CoreDataService.viewContext()
        // need to check category for selected wallet
        let predicate = NSPredicate(format: "wallet == %@", wallet)
        if let categoriesCount = try? CoreDataService.countObjects(Categories.self, predicate: predicate, context: targetContext) {
            if categoriesCount > 0 {
                return nil
            } else {
                // create new category
                let newCategory = Categories(context: targetContext)
                newCategory.name = Constants.Category.defaultCategoryName
                newCategory.wallet = wallet
                
                return newCategory
            }
        }
        return nil
    }
    
    static func fetchCategoryFor(wallet: WalletModel, context: NSManagedObjectContext? = nil) -> [CategoryModel] {
        var categories = [CategoryModel]()
        if let wallet = WalletsService.fetchWallet(wallet), let walletCategories = wallet.categories {
            for object in walletCategories {
                categories.append(object)
            }
        }
        return categories
    }

    static func addNewCategory(name: String, wallet: inout WalletModel, context: NSManagedObjectContext? = nil) -> CategoryModel? {
        // need to check unic new category name
        guard name.count > 0 else {
            return nil
        }
        let categories = fetchCategoryFor(wallet: wallet, context: context)
        for category in categories {
            if category.name == name {
                return nil
            }
        }
        let newCategory = CategoryModel(id: nil, name: name)
        wallet.addCategory(newCategory)
        return newCategory
    }
    
//    static func fetchCategoryWith(id: NSManagedObjectID) -> CategoryModel? {
//        if let category = CoreDataService.fetchObject(Categories.self, withId: id) {
//            return createModelClassFrom(object: category)
//        } else {
//            return nil
//        }
//    }
//
//    static func fetchCategoryObjectWith(id: NSManagedObjectID) -> Categories? {
//        if let category = CoreDataService.fetchObject(Categories.self, withId: id) {
//            return category
//        } else {
//            return nil
//        }
//    }
//
//    static func createCategory(_ categoryModel: CategoryModel) -> Categories? {
//        guard let code = categoryModel.code, let name = currencyModel.name, let shortName = currencyModel.shortName else {
//            // TODO: need to return error
//            return nil
//        }
//
//        // need to check currency code unic
//        let predicate = NSPredicate(format: "name == %@ OR code == %@", name, code)
//        if let objects = try? CoreDataService.fetchObjects(Currencies.self, sortBy: nil, predicate: predicate) {
//            if !objects.isEmpty {
//                return objects.first
//            }
//        }
//
//        // create new currency
//        if let newCurrency = NSEntityDescription.insertNewObject(forEntityName: "Currencies", into: CoreDataService.context()) as? Currencies {
//            newCurrency.code = code
//            newCurrency.name = name
//            newCurrency.shortName = shortName
//
//            return newCurrency
//        }
//
//        return nil
//    }

    // MARK: convert

    static func createModelClassFrom(object: Categories) -> CategoryModel {
        return CategoryModel(id: object.objectID, name: object.name)
    }
    
    static func objectClassFromModel(_ model: CategoryModel, context: NSManagedObjectContext? = nil) -> Categories? {
        // no need to search with name + wallet at that moment becouse if you have category model - you must to have model ID
        let targetContext = context ?? CoreDataService.viewContext()
        if let modelID = model.id as? NSManagedObjectID {
            return CoreDataService.fetchObject(Categories.self, withId: modelID, context: targetContext)
        }
        return nil
    }
}
