//
//  SettingsPresenter.swift
//  WiMM
//
//  Created by Завгородянський Олег on 4/2/18.
//  Copyright © 2018 Завгородянський Олег. All rights reserved.
//

import Foundation

class SettingsPresenter {

    // MARK: Properties

    weak var view: SettingsView?
    var router: SettingsWireframe?
    var interactor: SettingsUseCase?
}

extension SettingsPresenter: SettingsPresentation {
    
    func prepareDataSource() {
        interactor?.prepareDataSource()
    }
    
    func showWalletsList() {
        router?.showWalletsList()
    }
    
    func showCurrenciesList() {
        
    }
}

extension SettingsPresenter: SettingsInteractorOutput {
    
    func onPrepareDataSource(_ data: [SettingsModel]) {
        view?.updateViewWithData(data)
    }
}
