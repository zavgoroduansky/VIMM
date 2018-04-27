//
//  WalletsListContract.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/3/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation
import UIKit

protocol WalletsListView: class {
    
    func updateViewWith(dataSource: [WalletModel])
}

protocol WalletsListPresentation: class {
    
    func prepareDataSource()
    func showNewWalletModule()
}

protocol WalletsListUseCase: class {
    
    func fetchWallets()
}

protocol WalletsListInteractorOutput: class {
    
    func onFetchingWallets(wallets: [WalletModel])
}

protocol WalletsListWireframe: class {
    
    func showNewWalletModule()
}
