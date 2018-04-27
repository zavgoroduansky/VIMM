//
//  SettingsInteractor.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/2/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class SettingsInteractor {

    // MARK: Properties

    weak var output: SettingsInteractorOutput?
}

extension SettingsInteractor: SettingsUseCase {
    
    func prepareDataSource() {
        var dataSource = [SettingsModel]()
        
        dataSource.append(SettingsModel(image: "wallets_icon", text: NSLocalizedString("WalletsCellName", comment: ""), descriptionText: NSLocalizedString("WalletsCellDescription", comment: ""), key: .wallets))
        dataSource.append(SettingsModel(image: "currencies_icon", text: NSLocalizedString("CurrenciesCellName", comment: ""), descriptionText: NSLocalizedString("CurrenciesCellDescription", comment: ""), key: .currencies))
        
        output?.onPrepareDataSource(dataSource)
    }
}
