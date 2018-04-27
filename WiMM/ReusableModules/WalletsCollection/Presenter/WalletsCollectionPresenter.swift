//
//  WalletsCollectionPresenter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 3/22/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class WalletsCollectionPresenter {

    // MARK: Properties

    weak var view: WalletsCollectionView?
    var router: WalletsCollectionWireframe?
    var interactor: WalletsCollectionUseCase?
    
    weak var delegate: WalletCollectionDelegate?
}

extension WalletsCollectionPresenter: WalletsCollectionPresentation {
    
    func prepareDataSource() {
        interactor?.fetchWalletsFromStorage()
    }
    
    func didSelect(wallet: WalletModel) {
        delegate?.didSelect(wallet: wallet)
    }
}

extension WalletsCollectionPresenter: WalletsCollectionInteractorOutput {
    
    func onFetchWalletsSuccess(_ wallets: [WalletModel]) {
        if wallets.count > 0 {
            self.delegate?.didSelect(wallet: wallets[0])
        }
        self.view?.updateViewWithData(wallets)
    }
}
