//
//  WalletsListPresenter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/3/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class WalletsListPresenter {

    // MARK: Properties

    weak var view: WalletsListView?
    var router: WalletsListWireframe?
    var interactor: WalletsListUseCase?
}

extension WalletsListPresenter: WalletsListPresentation {
    
    func prepareDataSource() {
        interactor?.fetchWallets()
    }
    
    func showNewWalletModule() {
        router?.showNewWalletModule()
    }
}

extension WalletsListPresenter: WalletsListInteractorOutput {
    
    func onFetchingWallets(wallets: [WalletModel]) {
        view?.updateViewWith(dataSource: wallets)
    }
}
