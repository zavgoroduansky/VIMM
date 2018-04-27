//
//  SettingsContract.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/2/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

protocol SettingsView: class {
    
    func updateViewWithData(_ data: [SettingsModel])
}

protocol SettingsPresentation: class {
    
    func prepareDataSource()
    func showWalletsList()
    func showCurrenciesList()
}

protocol SettingsUseCase: class {
    
    func prepareDataSource()
}

protocol SettingsInteractorOutput: class {
    
    func onPrepareDataSource(_ data: [SettingsModel])
}

protocol SettingsWireframe: class {
    
    func showWalletsList()
}
