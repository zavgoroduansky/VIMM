//
//  WalletsCollectionInteractor.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class WalletsCollectionInteractor {

    // MARK: Properties

    weak var output: WalletsCollectionInteractorOutput?
}

extension WalletsCollectionInteractor: WalletsCollectionUseCase {
    
    func fetchWalletsFromStorage() {
        let wallets = WalletsService.fetchAllWallets()
        output?.onFetchWalletsSuccess(wallets)
    }
}
