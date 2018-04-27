//
//  NewWalletInteractor.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/25/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class NewWalletInteractor {

    // MARK: Properties

    weak var output: NewWalletInteractorOutput?
}

extension NewWalletInteractor: NewWalletUseCase {
    
    func checkNewWalletName(_ name: String) {
        
        if WalletsService.checkWalletNameUnic(walletName: name) {
            output?.onCheckNewWalletName(nil)
        } else {
            // need to prepare error string text
            let errorString = NSLocalizedString("NewWalletNameUnicError", comment: "")
            output?.onCheckNewWalletName(errorString)
        }
    }
}
