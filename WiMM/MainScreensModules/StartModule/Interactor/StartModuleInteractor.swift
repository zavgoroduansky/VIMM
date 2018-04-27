//
//  StartModuleInteractor.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class StartModuleInteractor {

    // MARK: Properties

    weak var output: StartModuleInteractorOutput?
}

extension StartModuleInteractor: StartModuleUseCase {
    
    func fetchBalanceFor(wallet: WalletModel) {
        let balance = 100
        output?.onFetching(balance: String(balance), for: wallet)
    }
    
}
