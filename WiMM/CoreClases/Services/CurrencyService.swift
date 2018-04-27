//
//  CurrencyService.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/6/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CurrencyService {
    
    static func initializeCurrencies(context: NSManagedObjectContext? = nil) -> (usd: Currencies?, local: Currencies?) {
        var createdUSD: Currencies? = nil
        var createdLocal: Currencies? = nil
        
        if let curreciesList = FileManager().readCurrenciesList() {
            for element in curreciesList {
                if let currentValue = element.value as? NSDictionary {
                    let currencyModel = CurrencyModel(id: nil, code: currentValue.object(forKey: "code") as! Int16, name: currentValue.object(forKey: "name") as! String, shortName: currentValue.object(forKey: "shortName") as! String)
                    // create readed currencies
                    if currencyModel.code == Constants.Currency.usdCode {
                        createdUSD = createCurrency(currencyModel, context: context)
                    } else {
                        createdLocal = createCurrency(currencyModel, context: context)
                    }
                }
            }
        }
        return (createdUSD, createdLocal)
    }
    
    static func fetchAllCurrencies(context: NSManagedObjectContext? = nil) -> [CurrencyModel] {
        var currencies = [CurrencyModel]()
        if let objects = try? CoreDataService.fetchObjects(Currencies.self, context: context) {
            for object in objects {
                currencies.append(createModelClassFrom(object: object))
            }
        }
        return currencies
    }
    
    static func fetchCurrencyWith(code: Int16, context: NSManagedObjectContext? = nil) -> CurrencyModel? {
        var answer: CurrencyModel? = nil
        let predicate = NSPredicate(format: "code == %@", code)
        if let objects = try? CoreDataService.fetchObjects(Currencies.self, sortBy: nil, predicate: predicate, context: context) {
            answer = objects.isEmpty ? nil : createModelClassFrom(object: objects.first!)
        }
        return answer
    }
    
    static func fetchCurrencyWith(id: NSManagedObjectID, context: NSManagedObjectContext? = nil) -> CurrencyModel? {
        if let currency = CoreDataService.fetchObject(Currencies.self, withId: id, context: context) {
            return createModelClassFrom(object: currency)
        } else {
            return nil
        }
    }
    
    static func createCurrency(_ currencyModel: CurrencyModel, context: NSManagedObjectContext? = nil) -> Currencies {
        let targetContext = context ?? CoreDataService.viewContext()
        // need to check currency code unic
        let predicate = NSPredicate(format: "code == %d", currencyModel.code)
        if let objects = try? CoreDataService.fetchObjects(Currencies.self, sortBy: nil, predicate: predicate, context: targetContext) {
            if objects.count > 0 {
                let findingCurrency = objects.first!
                findingCurrency.name = currencyModel.name
                findingCurrency.shortName = currencyModel.shortName
                
                return findingCurrency
            }
        }
        
        // create new currency
        let newCurrency = Currencies(context: targetContext)
        newCurrency.code = currencyModel.code
        newCurrency.name = currencyModel.name
        newCurrency.shortName = currencyModel.shortName
        
        return newCurrency
    }
    
    // MARK: convert

    static func createModelClassFrom(object: Currencies) -> CurrencyModel {
        return CurrencyModel(id: object.objectID, code: object.code, name: object.name, shortName: object.shortName)
    }
    
    static func objectClassFromModel(_ model: CurrencyModel, context: NSManagedObjectContext? = nil) -> Currencies? {
        let targetContext = context ?? CoreDataService.viewContext()
        if let modelID = model.id as? NSManagedObjectID {
            return CoreDataService.fetchObject(Currencies.self, withId: modelID, context: targetContext)
        } else {
            let predicate = NSPredicate(format: "code == %d", model.code)
            if let objects = try? CoreDataService.fetchObjects(Currencies.self, sortBy: nil, predicate: predicate, context: targetContext) {
                if objects.count > 0 {
                    return objects.first!
                }
            }
        }
        return nil
    }
}
