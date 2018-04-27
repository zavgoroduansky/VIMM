//
//  WalletsCollectionContract.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

protocol WalletsCollectionView: class {
    
    func updateViewWithData(_ dataSource : [WalletModel])
    
}

protocol WalletsCollectionPresentation: class {
    
    func prepareDataSource()
    func didSelect(wallet: WalletModel)
    
}

protocol WalletsCollectionUseCase: class {
    
    func fetchWalletsFromStorage()
    
}

protocol WalletsCollectionInteractorOutput: class {
    
    func onFetchWalletsSuccess(_ wallets: [WalletModel])
    
}

protocol WalletsCollectionWireframe: class {
    // TODO: Declare wireframe methods
}

protocol WalletCollectionDelegate: class {
    
    func didSelect(wallet: WalletModel)
}
