//
//  FileManager.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/18/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class FileManager {
    
    func readCurrenciesList() -> NSDictionary? {
        var myDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "CurrenciesList", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        return myDict
    }
    
}
