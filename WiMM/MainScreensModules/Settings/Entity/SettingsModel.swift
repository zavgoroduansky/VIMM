//
//  File.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/2/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

enum SettingsModelType: String {
    case wallets = "walletSegue"
    case currencies = "currencySegue"
}

struct SettingsModel {
    
    var image: String?
    var text: String
    var descriptionText: String?
    var key: SettingsModelType
}
