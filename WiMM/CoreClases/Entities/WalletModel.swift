//
//  Wallet.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/6/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

struct WalletModel {
    
    var id: Any?
    var name: String
    var currency: CurrencyModel?
    var categories: [CategoryModel]?
    
    mutating func addCategory(_ category: CategoryModel) {
        if categories == nil {
            categories = [CategoryModel]()
        }
        categories?.append(category)
    }
}
