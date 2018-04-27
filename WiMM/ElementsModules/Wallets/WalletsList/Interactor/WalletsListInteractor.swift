//
//  WalletsListInteractor.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/3/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class WalletsListInteractor {

    // MARK: Properties

    weak var output: WalletsListInteractorOutput?
}

extension WalletsListInteractor: WalletsListUseCase {
    
    func fetchWallets() {
        output?.onFetchingWallets(wallets: WalletsService.fetchAllWallets())
    }
}
